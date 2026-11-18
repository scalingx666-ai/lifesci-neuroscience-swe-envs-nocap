# Issue

**Title:** Http

## Description

Fixed a few bugs.

1) can now load data from https addresses fixes issue #359 
2) Adjacency.isc is now set to only work with single matrices
3) Refactored roi_plot_brain (again) to speed up image generation even more. went from 30s to under 1s with single scalar values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d61473c2cca3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.