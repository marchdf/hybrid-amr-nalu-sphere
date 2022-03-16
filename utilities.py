"""Utilities for scripts."""
import yaml
import numpy as np

# from scipy.optimize import fsolve
from scipy.optimize import brentq


def parse_ic(fname):
    """Parse the Nalu yaml input file for the initial conditions."""
    with open(fname, "r") as stream:
        try:
            dat = yaml.full_load(stream)
            u0 = float(
                dat["realms"][0]["initial_conditions"][0]["value"]["velocity"][0]
            )
            rho0 = float(
                dat["realms"][0]["material_properties"]["specifications"][0]["value"]
            )
            mu = float(
                dat["realms"][0]["material_properties"]["specifications"][1]["value"]
            )
            turb_model = dat["realms"][0]["solution_options"]["turbulence_model"]
            dt = dat["Time_Integrators"][0]["StandardTimeIntegrator"]["time_step"]

            return u0, rho0, mu, turb_model, dt

        except yaml.YAMLError as exc:
            print(exc)


def tukeyWindow(N, params={"alpha": 0.1}):
    """Tukey window.

    See https://en.wikipedia.org/wiki/Window_function#Tukey_window
    """
    alpha = params["alpha"]
    w = np.zeros(N)
    L = N + 1
    for n in np.arange(0, int(N // 2) + 1):
        if (0 <= n) and (n < 0.5 * alpha * L):
            w[n] = 0.5 * (1.0 - np.cos(2 * np.pi * n / (alpha * L)))
        elif (0.5 * alpha * L <= n) and (n <= N / 2):
            w[n] = 1.0
        else:
            print("Something wrong happened at n = ", n)
        if n != 0:
            w[N - n] = w[n]
    return w


def getFFT(dt, y, normalize=False, window=True):
    """Compute FFT."""
    n = len(y)
    k = np.arange(n)
    frq = k / (n * dt)
    window = tukeyWindow(n) if window else 1.0
    norm = len(y) if normalize else 1.0
    ffty = np.fft.fft(window * y) / norm

    # Take the one sided version of it
    freq = frq[range(int(n // 2))]
    ffty = ffty[range(int(n // 2))]
    return freq, ffty


def find_symmetry_plane(df):
    """Find symmetry plane.

    Do this by finding the angle which sets the side force to zero."""

    # angle = fsolve(lambda x: np.mean(np.sin(x) * df.cy + np.cos(x) * df.cz), 0.0)
    angle = brentq(lambda x: np.mean(np.sin(x) * df.cy + np.cos(x) * df.cz), 0, np.pi)
    return angle
