# Issue

**Title:** Improve CircleCI caching

## Description

"Dogfooding" the minimal cmds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a8cdaeea29c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.