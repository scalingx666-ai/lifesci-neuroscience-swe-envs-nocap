# Issue

**Title:** Feat: Subject Fine Tuning

## Description

Dual estimation for DyNeMo.
I'm not very sure whether it is necessary to match the covariance again when we fix the model RNN, and if so, should we match the mode time courses or the covariances. Matching with mode time courses will be significantly slower as we need to get alphas.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8018e44c1d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.