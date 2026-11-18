# Issue

**Title:** Fix right-left flipping issue

## Description

This pull request fixes the following issues:

- right-left rotation flipping
- right-left pan flipping
- reduced area for rotation, pan and clicking
- reduced window for flatmap
- clicking over subviewers not working accurately for 3D subviewers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13f31058824a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.