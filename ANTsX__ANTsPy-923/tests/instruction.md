# Issue

**Title:** COMP: Allow python >= 3.8

## Description

Push to 3.10 may have been premature. Wheels for releases are 3.10+ but I can still build from source and run tests on Linux with Python 3.8.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2212f56965e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.