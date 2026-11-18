# Issue

**Title:** Signal minor fix

## Description

Quickie: `Signal` class minor fix and minor addition:
- [X] `iterate` now works in 1D arrays (by dummy adding a dimension)
- [X]  new function `rolling` - do your rolling mean, var, or whatever (the function is passed as an argument)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3517cfcc2a63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.