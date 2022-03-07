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
    parser.add_argument(
        "--tmin",
        help="Time at which to start statistics (tau units)",
        default=0,
        type=float,
    )
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
    row = df[df.Re == Re]
    for coef in ["cd", "cl"]:
        plt.figure(coef)
        p = plt.axhline(row[coef].item(), xmin=0, xmax=30, lw=2, color=cidx, ls="--")
        plt.axhspan(
            row[coef].item() - row[coef + "_err"].item(),
            row[coef].item() + row[coef + "_err"].item(),
            facecolor=cidx,
            alpha=0.5,
        )
        plt.figure(coef + "-spectra")
        p = plt.axvline(row.st.item(), ymin=0, ymax=30, lw=2, color=cidx, ls="--")

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
    plt.figure("cd-spectra")
    p = plt.axvline(row.st.item(), ymin=0, ymax=30, lw=2, color=cidx, ls="--")

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
        u0, rho0, mu, turb_model, dt = utilities.parse_ic(yname)
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
        df = df[df["t"] > args.tmin]
        df["px"] = df.Fpx / (dynPres * refArea)
        df["vx"] = df.Fvx / (dynPres * refArea)
        df["cd"] = (df.Fpx + df.Fvx) / (dynPres * refArea)
        df["cy"] = (df.Fpy + df.Fvy) / (dynPres * refArea)
        df["cz"] = (df.Fpz + df.Fvz) / (dynPres * refArea)
        alpha = utilities.find_symmetry_plane(df)
        df["cl"] = -(np.cos(alpha) * df.cy - np.sin(alpha) * df.cz)
        df["cs"] = np.sin(alpha) * df.cy + np.cos(alpha) * df.cz

        means = df.mean()
        stats = {}
        for coef in ["cd", "cl", "cs"]:
            stats[coef] = means[coef]
            stats[coef + "_err"] = df[coef].max() - means[coef]

            plt.figure(coef)
            p = plt.plot(df["t"], df[coef], lw=2, color=cmap[i])
            p[0].set_dashes(dashseq[i])

            fhat, yhat = utilities.getFFT(dt, df[coef], normalize=True, window=False)
            yhat = np.abs(yhat[1:])
            fhat = fhat[1:]
            stats[coef + "_st"] = fhat[np.argmax(yhat)]
            plt.figure(coef + "-spectra")
            p = plt.plot(fhat * tau, yhat, lw=2, color=cmap[i])

        wdf = pd.read_csv(os.path.join(fdir, "results", "wall.dat"))
        wdf.phi = 180 - np.fabs(wdf.phi)
        wdf.sort_values(by=["phi"], inplace=True)
        wdf["cp"] = wdf.pressure / dynPres
        wdf["cf"] = wdf.tauw / dynPres

        bins = np.linspace(0, 180, 100)
        group = wdf.groupby(pd.cut(wdf.phi, bins))
        plot_centers = (bins[:-1] + bins[1:]) / 2
        cp_values = group.cp.mean()
        cf_values = group.cf.mean()

        plt.figure("cp")
        # p = plt.plot(wdf.phi, wdf.cp, lw=2, color=cmap[i], linestyle="None", marker="s", ms=1)
        # p = plt.plot(theta, cp, lw=2, color=cmap[-1])
        # p = plt.plot(phi, cp, lw=2, color=cmap[-1])
        p = plt.plot(plot_centers, cp_values, lw=2, color=cmap[-1])
        p[0].set_dashes(dashseq[i])

        plt.figure("cf")
        # p = plt.plot(wdf.theta, wdf.cf, lw=2, color=cmap[i])
        p = plt.plot(plot_centers, cf_values, lw=2, color=cmap[-1])
        p[0].set_dashes(dashseq[i])

        print(f"""Stats for {fdir}""")
        print(f"""Symmetry plane is at alpha = {np.degrees(alpha[0])}""")
        print(stats)

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

        plt.figure("cl")
        ax = plt.gca()
        plt.xlabel(r"$t$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$c_L$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # plt.xlim([0, 30])
        plt.ylim([-0.1, 0])
        legend = ax.legend(handles=legend_elements, loc="best")
        plt.tight_layout()
        pdf.savefig(dpi=300)

        plt.figure("cs")
        ax = plt.gca()
        plt.xlabel(r"$t$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$c_S$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        # plt.xlim([0, 30])
        plt.ylim([-0.1, 0.1])
        legend = ax.legend(handles=legend_elements, loc="best")
        plt.tight_layout()
        pdf.savefig(dpi=300)

        plt.figure("cd-spectra")
        ax = plt.gca()
        plt.xlabel(r"$St$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$\hat{C}_D$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        plt.xlim([0, 1])
        plt.ylim([0, 2e-3])
        legend = ax.legend(handles=legend_elements, loc="best")
        plt.tight_layout()
        pdf.savefig(dpi=300)

        plt.figure("cl-spectra")
        ax = plt.gca()
        plt.xlabel(r"$St$", fontsize=22, fontweight="bold")
        plt.ylabel(r"$\hat{C}_L$", fontsize=22, fontweight="bold")
        plt.setp(ax.get_xmajorticklabels(), fontsize=18, fontweight="bold")
        plt.setp(ax.get_ymajorticklabels(), fontsize=18, fontweight="bold")
        plt.xlim([0, 1])
        plt.ylim([0, 1e-2])
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
