# Issue

**Title:** Do not fail with an error if trying to clear empty cache dir

## Description

Small papercut, but in scripts that wanted to delete the cache dir (e.g. for benchmarking), it was annoying to have to deal with this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0161d658d10c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.