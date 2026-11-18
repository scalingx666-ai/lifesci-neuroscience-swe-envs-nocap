# Issue

**Title:** TVB-3176 Fixed the recursion failure in utils.py (reproduced on conda-forge)

## Description

- Replaced recursion with an iterative search.
- Added numeric suffixes when timestamps collide.
- Updated the test to freeze time and reliably reproduce the Windows clock-resolution issue in utils_test.py.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d34c081f5a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.