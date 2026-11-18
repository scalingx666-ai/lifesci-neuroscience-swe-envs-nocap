# Issue

**Title:** fix: setting incorrect direction raises descriptive error

## Description

Before, setting a direction with the wrong number of dimensions raised an error that said the origin had incorrect dimension. I have changed the error message to correctly reference the direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ec36318de96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.