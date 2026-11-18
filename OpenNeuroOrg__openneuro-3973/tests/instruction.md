# Issue

**Title:** fix(cli): Batch file adds to avoid message passing overhead for large datasets

## Description

This avoids a lot of messaging passing cost to adding many small files and exits earlier in the case of an error while adding files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0667a6f0805`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.