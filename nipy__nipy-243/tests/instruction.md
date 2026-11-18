# Issue

**Title:** BF: strange error when passing bool as mask type

## Description

np.bool_ as very reasonable mask input type caused an error for
np.nan_to_num.  Only run nan_to_num if floating point mask type.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eecbabc9dae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.