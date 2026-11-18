# Issue

**Title:** Screens refactor

## Description

I found a dataset that had the slice dimension first (the Haxby 2001 datset, ds105 on OpenFMRI.org).  To do slice timing we need to be able to specify the slice dimension.  These changes allow you to specify the slice dimension to the utilities for time series differences (which depend on slice).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e852b1ac7f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.