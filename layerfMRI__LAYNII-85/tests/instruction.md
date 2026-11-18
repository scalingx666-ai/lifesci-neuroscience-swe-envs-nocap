# Issue

**Title:** fixed small typos in LN_SKEW

## Description

standard deviation file was called as SETEV (should be STDEV) and output filename was setdev (should be stdev).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d41d6de5eefd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.