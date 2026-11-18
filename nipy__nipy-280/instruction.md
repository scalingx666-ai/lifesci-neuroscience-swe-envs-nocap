# Issue

**Title:** NEWFEATURE: get_cut_coords(...) function to heuristically compute good cross-sectional cut_coords

## Description

In the plot_map(...) API, if `cut_coords='auto'` is specified and `slicer`is one of `'x'`, `'y'`, `'z'`, then a series of 'cross-sectional' `cut_coords` is generated and used (similar to FSL activation maps).
- localizer_glm_ar.py demo script now uses this feature

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ae259fc072c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.