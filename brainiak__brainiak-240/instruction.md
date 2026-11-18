# Issue

**Title:** searchlight: Use pool at block level

## Description

This results in fewer Python function calls, which improves performance.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e230a01493ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.