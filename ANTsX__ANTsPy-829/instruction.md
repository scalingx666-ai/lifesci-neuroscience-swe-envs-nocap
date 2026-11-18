# Issue

**Title:** Pypi workflow

## Description

Push sdist and wheels for all platforms in one go. Use job dependency so partial releases don't happen again

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2a7a363abdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.