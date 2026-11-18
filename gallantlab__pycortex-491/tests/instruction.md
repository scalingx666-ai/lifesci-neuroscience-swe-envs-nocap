# Issue

**Title:** MNT require cython<3.0 to avoid breaking install

## Description

Cython 3.0 was released a couple of days ago, and it introduces changes that break our install process. For now we can just fix the issue by requiring cython < 3.0. In the long run, we may want to adapt our cythonized code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c1958b07b5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.