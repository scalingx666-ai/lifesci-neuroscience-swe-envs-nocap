# Issue

**Title:** dev: Unpin Pip, drop Python 3.5

## Description

Also make SciPy a build dependency, because unpining Pip breaks
the build otherwise.

Python 3.5 is no longer supported by NumPy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0deac2a736a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.