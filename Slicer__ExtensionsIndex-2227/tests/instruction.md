# Issue

**Title:** BUG: Fix git repository name check more robust

## Description

Fix git repository name check more robust and the error message more clear.

fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8273e974c6f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.