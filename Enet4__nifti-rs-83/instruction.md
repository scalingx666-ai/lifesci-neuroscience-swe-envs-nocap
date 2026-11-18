# Issue

**Title:** Remove traits for into_ndarray

## Description

It seems that `T: Mul<Output = T>,` and `T: Add<Output = T>,` are no longer used for the `into_ndarray` functions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dde1f0c7ab69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.