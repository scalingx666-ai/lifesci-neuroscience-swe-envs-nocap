# Issue

**Title:** [FIX] Use NumPy's float64 dtype

## Description

`numpy.float` is deprecated since numpy version 1.20 in favour of the built-in `float` type or the `numpy.float64` dtype.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `032d8265b8c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.