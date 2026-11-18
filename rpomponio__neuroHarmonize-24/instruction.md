# Issue

**Title:** Fix out of sample design matrix

## Description

This should construct the correct design matrix for out-of-sample harmonization. This incremental PR depends on #20.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4766d05922fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.