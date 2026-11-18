# Issue

**Title:** Add authentication to HDF5 tile methods

## Description

`tile.py` didn't have any authentication on its API methods, which seemed inadvisable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a12df5f581ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.