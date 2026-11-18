# Issue

**Title:** MRG: test against pre-release numpy / scipy

## Description

Use pre-release numpy / scipy wheels for testing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd147a1e035e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.