# Issue

**Title:** [FIX] - update the alias for dev and latest

## Description

Will also only update latest when a stable version is release. In other words, if the release tag doesn't match `'[0-9]+.[0-9]+.[0-9]+'` the latest version in the doc wont be updated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b963db9227f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.