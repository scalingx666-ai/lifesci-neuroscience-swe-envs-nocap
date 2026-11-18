# Issue

**Title:** Monitor fractional occupancy during HMM training

## Description

Changes:
- Calculate fractional occupancy (FO) during HMM training. This is added to the `history` object.
- Option to specify a tolerance for maximum FO change to stop training early.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b03c477331b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.