# Issue

**Title:** fix: fixed segfault due to cross-thread GL cleanup

## Description

OpenGL thread management to prevent crashes caused by GL resources being garbage collected off the window's thread

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a497101ffdc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.