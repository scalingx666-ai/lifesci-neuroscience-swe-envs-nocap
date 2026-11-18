# Issue

**Title:** perf: don't make extra copies of the input data unnecessarily

## Description

Use tricks to avoid calling `flatten()` and `astype(copy=True)` avoid changing the data type.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16cf37660a3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.