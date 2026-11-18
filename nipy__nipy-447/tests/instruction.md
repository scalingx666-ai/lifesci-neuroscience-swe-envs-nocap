# Issue

**Title:** BF: fix for division error gh-446

## Description

Thanks to @Amiiir for tracking down this error.

Closes gh-446.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `628ad8dc41dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.