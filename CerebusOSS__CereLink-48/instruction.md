# Issue

**Title:** Make cbhwlib Qt5 compatible

## Description

All that needs to be done to support Qt5 (while maintaining Qt4 compatibility) is to replace all calls to QString.toAscii() with QString.toLatin1().

Both function do the same, so there is no change in functionality.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9387c7e056a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.