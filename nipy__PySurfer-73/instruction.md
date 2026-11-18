# Issue

**Title:** FIX: don't import surfer in setup.py

## Description

Importing `surfer` in `setup.py` can create problems when installing the package without an X server running. See e.g.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c1bcf4e0f81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.