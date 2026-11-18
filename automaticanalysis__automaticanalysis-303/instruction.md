# Issue

**Title:** ENH: Adapt aa_test to use matlab unittest framework

## Description

This to enable adding non-use-case tests, which needs more advanced filtering options, while keeping aa_test as the entry point for all testing

For now, the changes are backward compatible with how aa_test could be used before. Only the log file has more info in it now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ac027e04567`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.