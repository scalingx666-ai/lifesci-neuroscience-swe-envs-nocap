# Issue

**Title:** Fix caching in CI

## Description

The cache wasn't actually being saved leading to longer CI run times.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a7186b37479`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.