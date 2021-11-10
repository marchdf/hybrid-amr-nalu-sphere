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

    # plot stuff
    fname = "plots.pdf"
    legend_elements = []

    Re = 1000

    # Plot reference values
    legend_elements += (
        Line2D([0], [0], lw=2, color=cmap[-1], label="Fornberg (1988)"),
    )
    df = pd.read_csv(os.path.join(expdir, "cd.txt"))
    plt.figure("cd")
    row = df[df.Re == Re]
    p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cmap[-1])

    legend_elements += (Line2D([0], [0], lw=2, color=cmap[-2], label="Fadlun (2000)"),)
    df = pd.read_csv(os.path.join(ibdir, "cd.txt"))
    plt.figure("cd")
    row = df[df.Re == Re]
    p = plt.axhline(row.cd.item(), xmin=0, xmax=30, lw=2, color=cmap[-2], ls="--")

    # Nalu data
    for i, fdir in enumerate(args.fdir):

        yname = os.path.join(fdir, "sphere-nwind.yaml")
        u0, rho0, mu, turb_model = utilities.parse_ic(yname)
        dynPres = rho0 * 0.5 * u0 * u0
        diameter = 1.0
        refArea = diameter
        tau = diameter / u0
        model = turb_model.upper().replace("_", "-")
        legend_elements += [
            Line2D([0], [0], lw=2, color=cmap[i], label="Nalu-Wind/AMR-Wind"),
            Line2D([0], [0], lw=2, color=cmap[i + 1], label="pressure component"),
            Line2D([0], [0], lw=2, color=cmap[i + 2], label="viscous component"),
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

        plt.figure("cd")
        p = plt.plot(df["t"], df.cd, lw=2, color=cmap[i])
        p = plt.plot(df["t"], df.px, lw=2, color=cmap[i + 1])
        p = plt.plot(df["t"], df.vx, lw=2, color=cmap[i + 2])
        p[0].set_dashes(dashseq[i])

        # plt.figure("cl")
        # p = plt.plot(df["t"], df.cl, lw=2, color=cmap[i])
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
        plt.ylim([0, 1.0])
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
