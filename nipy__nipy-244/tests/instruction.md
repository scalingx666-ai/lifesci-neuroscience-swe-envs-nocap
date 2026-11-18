# Issue

**Title:** Refactor axis finding

## Description

After using it for a bit, it seemed to me that we should always fix the very common TR = 0 axis problem (at least by default).   Changed the code and tests to reflect this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5eecbabc9dae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.