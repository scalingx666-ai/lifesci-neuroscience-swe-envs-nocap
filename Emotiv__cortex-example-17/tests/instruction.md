# Issue

**Title:** Cpp fix issue with authorize

## Description

Fix a bug with the debit parameter of the authorize method.
Call queryRecords at the end of the marker example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `532a6ace39bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.