# Issue

**Title:** Fix assert condition

## Description

In the current version, this assertion will throw errors if the size of edata is correct and vice versa. The condition should be inverted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3669307a688`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.