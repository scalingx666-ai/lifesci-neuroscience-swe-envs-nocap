# Issue

**Title:** Changes from divest 0.2

## Description

This PR contains changes to `dcm2niix` code made in support of `divest`, as of version 0.2.0. Most are R-specific and hence fenced with `#ifdef HAVE_R`, but there are a few other tweaks:

- Arranging for `nii_saveCrop` to return a status code, similar to other, related functions.
- Adding braces to avoid compilation problems when the `divest` versions of the various print macros are used.
- Avoiding use of the `long long` type, which [can create portability problems](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#FOOT69).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `724764dda539`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.