# Issue

**Title:** Add trial-masked detrending

## Description

Function that create a weight matrix (n_channels * n_times) with masked periods (value of zero) in order to mask the trials of interest during detrending. Related to #35

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `852391ba5c1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.