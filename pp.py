"""Post process."""

import argparse
import os
import numpy as np
import pandas as pd
from mpi4py import MPI
import stk
import utilities
from scipy.interpolate import griddata


def p0_printer(par):
    iproc = par.rank

    def printer(*args, **kwargs):
        if iproc == 0:
            print(*args, **kwargs)

    return printer


if __name__ == "__main__":

    # Parse arguments
    parser = argparse.ArgumentParser(description="A simple post-processing tool")
    parser.add_argument(
        "-m",
        "--mfile",
        help="Root name of files to postprocess",
        required=True,
        type=str,
    )
    parser.add_argument("--auto_decomp", help="Auto-decomposition", action="store_true")
    parser.add_argument(
        "-v",
        "--vel_name",
        help="Name of the velocity field",
        default="velocity",
        type=str,
    )
    parser.add_argument(
        "--navg", help="Number of times to average", default=40, type=int
    )
    parser.add_argument(
        "--flowthrough", help="Flowthrough time (L/u)", default=1.0, type=float
    )
    parser.add_argument(
        "--factor",
        help="Factor of flowthrough time between time steps used in average",
        type=float,
        default=1.2,
    )
    args = parser.parse_args()

    fdir = os.path.dirname(args.mfile)

    comm = MPI.COMM_WORLD
    size = comm.Get_size()
    rank = comm.Get_rank()
    par = stk.Parallel.initialize()
    printer = p0_printer(par)

    mesh = stk.StkMesh(par)
    printer("Reading meta data for mesh: ", args.mfile)
    mesh.read_mesh_meta_data(args.mfile, auto_decomp=args.auto_decomp)
    printer("Done reading meta data")

    printer("Loading bulk data for mesh: ", args.mfile)
    mesh.populate_bulk_data()
    printer("Done reading bulk data")

    num_time_steps = mesh.stkio.num_time_steps
    max_time = mesh.stkio.max_time
    tsteps = np.array(mesh.stkio.time_steps)
    printer(f"""Num. time steps = {num_time_steps}\nMax. time step  = {max_time}""")

    # Figure out the times over which to average
    if args.factor > 0:
        tmp_tavg = np.sort(
            tsteps[-1] - args.flowthrough * args.factor * np.arange(args.navg)
        )
        dist = np.abs(np.array(tsteps)[:, np.newaxis] - tmp_tavg)
        idx = dist.argmin(axis=0)
    else:
        idx = np.arange(len(tsteps) - args.navg, len(tsteps))
    tavg = tsteps[idx]
    tavg_instantaneous = tsteps[idx[0] :]
    printer("Averaging the following steps:")
    printer(tavg)

    # Extract time and spanwise average tau_wall on wall
    walldata = None
    for tstep in tavg_instantaneous:
        ftime, missing = mesh.stkio.read_defined_input_fields(tstep)
        printer(f"Loading tau_wall fields for time: {ftime}")

        coords = mesh.meta.coordinate_field
        wall = mesh.meta.get_part("wall")
        sel = wall & mesh.meta.locally_owned_part
        tauw = mesh.meta.get_field("tau_wall")
        tauwv = mesh.meta.get_field("tau_wall_vector")
        pressure = mesh.meta.get_field("pressure")
        names = ["x", "y", "z", "tauw", "tauwx", "tauwy", "tauwz", "pressure"]
        nnodes = sum(bkt.size for bkt in mesh.iter_buckets(sel, stk.StkRank.NODE_RANK))

        cnt = 0
        data = np.zeros((nnodes, len(names)))
        for bkt in mesh.iter_buckets(sel, stk.StkRank.NODE_RANK):
            xyz = coords.bkt_view(bkt)
            tw = tauw.bkt_view(bkt)
            twv = tauwv.bkt_view(bkt)
            pres = pressure.bkt_view(bkt)
            data[cnt : cnt + bkt.size, :] = np.hstack(
                (xyz, tw.reshape(-1, 1), twv, pres.reshape(-1, 1))
            )
            cnt += bkt.size

        if walldata is None:
            walldata = np.zeros(data.shape)
        walldata += data / len(tavg_instantaneous)

    lst = comm.gather(walldata, root=0)
    comm.Barrier()
    if rank == 0:
        df = pd.DataFrame(np.vstack(lst), columns=names)
        df["r"] = np.sqrt(df.x ** 2 + df.y ** 2 + df.z ** 2)
        df["theta"] = 180 - np.arccos(df.x / df.r) * 180 / np.pi
        wallname = os.path.join(fdir, "wall.dat")
        df.to_csv(wallname, index=False)
