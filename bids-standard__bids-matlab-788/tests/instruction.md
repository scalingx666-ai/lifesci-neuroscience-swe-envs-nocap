# Issue

**Title:** [FIX] Clarify error message for invalid label characters

## Description

Improves the error message when a label contains invalid characters, specifying that only alphanumeric and "+" are allowed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f70edca5f3b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.