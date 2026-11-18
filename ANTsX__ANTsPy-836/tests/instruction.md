# Issue

**Title:** BUG:  Remove isolated deterministic handling.

## Description

Centralize deterministic vs. non-deterministic behavior setting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a3da9a343a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.