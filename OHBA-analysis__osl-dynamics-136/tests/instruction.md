# Issue

**Title:** Refactored config API

## Description

Changes:
- Maybe it's not necessary to put the command line interface function into its own module. I moved the function and renamed for more clarity.
- Added instructions to the module docstrings to help people use the command line interface.

@evanr70, merge if you're happy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `201b628d0fe7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.