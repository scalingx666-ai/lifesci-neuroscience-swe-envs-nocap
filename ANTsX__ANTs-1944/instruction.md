# Issue

**Title:** CI: Docker version numbering

## Description

For a while we've done v1.2.3 and 1.2.3, switch to 1.2.3 only

Also make latest point to latest numbered release, not current development build

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b53aad349e67`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.