# Issue

**Title:** MRG+1: allowing transparency in divergent colormaps

## Description

When analysing some of my data I came across the issue that I couldn't use a divergent colormap for, e.g., correlations or t-values and at the same time let small values in the middle of the colormap be transparent. So I have adapted Brain.scale_data_colormap such that it can now handle transparency in divergent colormaps properly. Also, I added the option to set the overall alpha-level of the colormap while maintaining transparency of a particular region in the colormap. The usage of these features is demonstrated in examples/plot_resting_correlations.py.

I believe that these changes make it easier to explore suitable visualisations of divergent data and hope that you find them useful!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e325192bb6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.