# Issue

**Title:** Push 28.0.2 into 29-release branch

## Description

Push changes from the latest bugfix release into the 29 branch, so that they are incorporated into 29.0.0 when it's released.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e66009c1641`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.