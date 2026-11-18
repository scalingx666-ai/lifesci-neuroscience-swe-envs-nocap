# Issue

**Title:** MAINT: Sort in pre-commit

## Description

A comment over in #1466 made me realize we should add this sorter. We use it in MNE-Python. Nice it doesn't catch anything new here! (I deleted the duplicate entry same is in #1466, though.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5102e1180a41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.