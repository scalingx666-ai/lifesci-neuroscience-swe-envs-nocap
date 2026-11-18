# Issue

**Title:** dev: Fix Pip installation during Conda build

## Description

Our dependency installation method was not supported anymore:


Note to self: read release notes first when debugging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e09b3458a825`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.