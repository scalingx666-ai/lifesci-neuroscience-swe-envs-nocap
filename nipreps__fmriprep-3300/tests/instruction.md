# Issue

**Title:** RF: Fix ITK warp conversion to nitransforms format

## Description

Alternative to (and builds on) #3296.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `604eeef0aee3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.