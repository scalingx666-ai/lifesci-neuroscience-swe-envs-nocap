# Issue

**Title:** dev: Update Pip in pr-check

## Description

Otherwise, we rely on the PR submitter to maintain an updated Pip
installation, which makes reproducing errors more difficult.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e503afeb56e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.