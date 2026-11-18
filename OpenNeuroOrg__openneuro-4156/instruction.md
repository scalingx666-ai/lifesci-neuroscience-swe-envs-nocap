# Issue

**Title:** fix(cli): Show adding files step progress for large datasets

## Description

Adds a progress bar for the add step as this can take significant time on larger datasets or slower filesystems.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a6df33f5425`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.