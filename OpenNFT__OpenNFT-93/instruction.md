# Issue

**Title:** Minor fixes and refactoring for rtQA

## Description

FIXED:

1. FD save error in rtQA python
2. Code refactoring in rtQA matlab part
3. Moved snr_map_created flag for rtQA off mode

CHANGED:

1. Muster plot Y range limits on main and rtQA panels on setup

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8ff0fa13085`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.