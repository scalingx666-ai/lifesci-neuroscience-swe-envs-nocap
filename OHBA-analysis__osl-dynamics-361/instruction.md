# Issue

**Title:** Enhancement: Support for Custom Colormaps in Plotting Functions

## Description

This PR extends the functionality of the plotting utilities in `osl_dynamics.utils.plotting` by allowing users to pass a `matplotlib.colors.ListedColormap` object directly as the colormap argument.

Previously, only string identifiers that correspond to a matplotlib colormap were supported. With this update, users can now utilize colormaps from the `seaborn` package or their own custom colormaps.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ead90edf97a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.