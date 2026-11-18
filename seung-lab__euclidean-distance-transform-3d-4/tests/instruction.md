# Issue

**Title:** feat: black_border parameter

## Description

Most EDT implementations don't use a black border. For feature parity, we should make that a choice.

We may also want to experiment with and without it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b2076466be3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.