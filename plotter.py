#!/usr/bin/env python3

import argparse
import os
import glob
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from matplotlib.lines import Line2D
import pandas as pd
import numpy as np
import utilities
from scipy.signal import savgol_filter


plt.rc("text", usetex=True)
cmap_med = [
    "#F15A60",
    "#7AC36A",
    "#5A9BD4",
    "#FAA75B",
    "#9E67AB",
    "#CE7058",
    "#D77FB4",
    "#737373",
]
cmap = [
    "#EE2E2F",
    "#008C48",
    "#185AA9",
    "#F47D23",
    "#662C91",
    "#A21D21",
    "#B43894",
    "#010202",
]
dashseq = [
    (None, None),
    [10, 5],
    [10, 4, 3, 4],
    [3, 3],
    [10, 4, 3, 4, 3, 4],
    [3, 3],
    [3, 3],
]
markertype = ["s", "d", "o", "p", "h"]


if __name__ == "__main__":

    # Parse arguments
    parser = argparse.ArgumentParser(description="A simple plot tool")
    parser.add_argument("-f", "--fdir", nargs="+", help="Folder to plot", required=True)
    args = parser.parse_args()

    # Reference data
    refdir = os.path.abspath("refdata")
    expdir = os.path.join(refdir, "fornberg1988")
    ibdir = os.path.join(refdir, "fadlun2000")
    jpdir = os.path.join(refdir, "johnson1999")

    tbdir = os.path.join(refdir, "tomboulides2000")
    ngdir = os.path.join(refdir, "nagata2020")

    # plot stuff
    fname = "plots.pdf"
    legend_elements = []

    Re = 300

    # Plot reference values
    # legend_elements += (
    #     Line2D([0], [0], lw=2, color=cmap[-1], label="Fornberg (1988)"),
    # )
    # df = pd.read_csv(os.path.join(expdir, "cd.txt"))
    # plt.figure("cd")
    # row = df[df.Re == Re]
    # p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cmap[-1])

    # legend_elements += (Line2D([0], [0], lw=2, color=cmap[-2], label="Fadlun (2000)"),)
    # df = pd.read_csv(os.path.join(ibdir, "cd.txt"))
    # plt.figure("cd")
    # row = df[df.Re == Re]
    # p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cmap[-2], ls="--")

    cidx = cmap[-1]
    legend_elements += (Line2D([0], [0], lw=2, color=cidx, label="Johnson (1999)"),)
    df = pd.read_csv(os.path.join(jpdir, "cd.txt"))
    plt.figure("cd")
    row = df[df.Re == Re]
    p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cidx, ls="--")
    plt.axhspan(
        row.cd.item() - row.cd_err.item(),
        row.cd.item() + row.cd_err.item(),
        facecolor=cidx,
        alpha=0.5,
    )

    cidx = cmap[-2]
    legend_elements += (Line2D([0], [0], lw=2, color=cidx, label="Tomboulides (2000)"),)
    df = pd.read_csv(os.path.join(tbdir, "cd.txt"))
    plt.figure("cd")
    row = df[df.Re == Re]
    p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cidx, ls="--")
    plt.axhspan(
        row.cd.item() - row.cd_err.item(),
        row.cd.item() + row.cd_err.item(),
        facecolor=cidx,
        alpha=0.5,
    )

    cidx = cmap[-3]
    legend_elements += (Line2D([0], [0], lw=2, color=cidx, label="Nagata (2020)"),)
    df = pd.read_csv(os.path.join(ngdir, "cd.txt"))
    plt.figure("cd")
    row = df[df.Re == Re]
    p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cidx, ls="--")
    plt.figure("cp")
    df = pd.read_csv(os.path.join(ngdir, "cp.csv"))
    p = plt.plot(df.theta, savgol_filter(df.cp, 21, 4), lw=2, color=cidx)
    # p = plt.plot(df.theta, df.cp, lw=2, color=cmap[-1])
    plt.figure("cf")
    df = pd.read_csv(os.path.join(ngdir, "cf.csv"))
    p = plt.plot(df.theta, savgol_filter(df.cf, 21, 4), lw=2, color=cidx)
    # p = plt.plot(df.theta, df.cf, lw=2, color=cmap[-1])

    # Nalu data
    for i, fdir in enumerate(args.fdir):

        yname = os.path.join(fdir, "sphere-nwind.yaml")
        u0, rho0, mu, turb_model = utilities.parse_ic(yname)
        dynPres = rho0 * 0.5 * u0 * u0
        diameter = 1.0
        refArea = np.pi * diameter * diameter / 4.0
        tau = diameter / u0
        model = turb_model.upper().replace("_", "-")
        legend_elements += [
            Line2D([0], [0], lw=2, color=cmap[i], label="Nalu-Wind"),
        ]

        all_files = glob.glob(os.path.join(fdir, "forces*.dat"))
        df = pd.concat(
            (pd.read_csv(f, delim_whitespace=True) for f in all_files)
        ).sort_values(by="Time", ignore_index=True)
        df["t"] = df.Time / tau
        df["px"] = df.Fpx / (dynPres * refArea)
        df["vx"] = df.Fvx / (dynPres * refArea)
        df["cd"] = (df.Fpx + df.Fvx) / (dynPres * refArea)
        df["cl"] = (df.Fpy + df.Fvy) / (dynPres * refArea)
        df["cs"] = (df.Fpz + df.Fvz) / (dynPres * refArea)

        plt.figure("cd")
        p = plt.plot(df["t"], df.cd, lw=2, color=cmap[i])
        p[0].set_dashes(dashseq[i])

        # plt.figure("cl")
        # p = plt.plot(df["t"], df.cl, lw=2, color=cmap[i])
        # p[0].set_dashes(dashseq[i])

        # plt.figure("cs")
        # p = plt.plot(df["t"], df.cs, lw=2, color=cmap[i])
        # p[0].set_dashes(dashseq[i])

    # Save the plots
    with PdfPages(fname) as pdf:

        plt.figure("cd")
        ax = plt.gca()
        plt.xlabel(r"$t$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$c_D$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # plt.xlim([0, 30])
        plt.ylim([0.6, 0.7])
        legend = ax.legend(handles=legend_elements, loc="best")
        plt.tight_layout()
        pdf.savefig(dpi=300)

        plt.figure("cp")
        ax = plt.gca()
        plt.xlabel(r"$\theta$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$c_P$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # plt.xlim([0, 30])
        # plt.ylim([0.6, 0.7])
        legend = ax.legend(handles=legend_elements, loc="best")
        plt.tight_layout()
        pdf.savefig(dpi=300)

        plt.figure("cf")
        ax = plt.gca()
        plt.xlabel(r"$\theta$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$c_f$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # plt.xlim([0, 30])
        # plt.ylim([0.6, 0.7])
        legend = ax.legend(handles=legend_elements, loc="best")
        plt.tight_layout()
        pdf.savefig(dpi=300)

        # plt.figure("cl")
        # ax = plt.gca()
        # plt.xlabel(r"$t$", fontsize=22, fontweight="bold")
        # plt.ylabel(r"$c_L$", fontsize=22, fontweight="bold")
        # plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        # plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # # plt.xlim([0, 30])
        # plt.ylim([-0.5, 0.5])
        # legend = ax.legend(handles=legend_elements, loc="best")
        # plt.tight_layout()
        # pdf.savefig(dpi=300)
        # plt.figure("cl")

        # ax = plt.gca()
        # plt.xlabel(r"$t$", fontsize=22, fontweight="bold")
        # plt.ylabel(r"$c_S$", fontsize=22, fontweight="bold")
        # plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        # plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # # plt.xlim([0, 30])
        # plt.ylim([-0.5, 0.5])
        # legend = ax.legend(handles=legend_elements, loc="best")
        # plt.tight_layout()
        # pdf.savefig(dpi=300)
