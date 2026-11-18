# Issue

**Title:** chore(server): Fix duplicate index warning for WorkerTask collection

## Description

Unique implies index creation. Fixes a warning.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35f1e630a435`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.