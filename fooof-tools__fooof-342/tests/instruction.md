# Issue

**Title:** [MNT] - try new ubuntu tagged test version for py37

## Description

So this keeps the lights on for now for testing Python 3.7, though I think it might stop working again soon, so we might need to make some decisions on what Python versions we officially support / test against.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cbbec6878767`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.