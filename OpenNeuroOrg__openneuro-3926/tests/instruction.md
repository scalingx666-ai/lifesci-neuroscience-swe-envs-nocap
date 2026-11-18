# Issue

**Title:** fix(worker): Throw HTTP 403 on invalid token signatures

## Description

Previously this would throw HTTP 400 which is more suited to malformed tokens.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00b7bf3b216d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.