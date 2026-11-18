# Issue

**Title:** [FIX] Detrending error with high-order polynomials

## Description

There was a bug when using a multi-dimensional regressor in `detrend()`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35d79f322605`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.