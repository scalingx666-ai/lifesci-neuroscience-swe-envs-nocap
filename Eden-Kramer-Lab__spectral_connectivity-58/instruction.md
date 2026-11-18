# Issue

**Title:** add pairwise granger for subset of channel pairs

## Description

with large channel counts it can be useful to compute cross-spectral estimates and connectivity measures for just a subset of channels. i'm not sure if the way i accomplished this is the best approach or if you have other suggestions. it works for my purposes, anyway. let me know if you think it's useful

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f02a383fe7e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.