# Issue

**Title:** Cleanup Serializability checking in `base.py`

## Description

We currently have 4 functions for assessing serializability.
1) check_serializability is the core function
then 3+ functions that are just wrappers of check_serializability.

this PR deletes the wrappers and keeps the core function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d81d6357b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.