# Issue

**Title:** Handle NaNs in DyNeMo Training

## Description

Changes:
- Skip update and log a warning if a NaN is encountered in training.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e5ee8332f8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.