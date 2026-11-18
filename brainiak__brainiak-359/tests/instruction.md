# Issue

**Title:** dev: Fix TensorFlow workaround for our Jenkins server

## Description

PR #357 did not fix the problem.

This time I verified by applying this commit on the branch in PR #341.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b9005487bd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.