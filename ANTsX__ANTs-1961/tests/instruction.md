# Issue

**Title:** CI: allow workflow dispatch for testing release binaries

## Description

Also use hashes for upload actions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ceb21bad7fae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.