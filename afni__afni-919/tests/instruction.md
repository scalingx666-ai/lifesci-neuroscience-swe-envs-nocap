# Issue

**Title:** adding RSA-specific plots to 1dplot.py

## Description

Add histogram, heatmap, and scatter helpers to the Python `1dplot.py` backend.

- Add real binned histograms via `-histogram`
  - `-histbin N`
  - `-histwidth W`
  - `-density`
  - `-vline X [X ...]`

- Add matrix heatmaps via `-heat`
  - validates square 1D matrix input
  - supports `-reorder order.1D` to permute rows and columns together
  - supports `-zerocenter`
  - supports `-cbar`, including `Reds_and_Blues` and `Reds_and_Blues_Inv`

- Add scatter plot helpers
  - `-scatter` draws points instead of lines
  - `-diagonal` adds a dashed y=x reference line with equal scaling

- Update `1dplot.py -help` text for the new options

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3424b2ced435`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.