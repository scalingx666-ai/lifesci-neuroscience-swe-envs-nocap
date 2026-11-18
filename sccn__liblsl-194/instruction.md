# Issue

**Title:** Fix lsl_cpp.h exception handling

## Description

For error code lsl_lost_error, check_error() shall throw lost_error rather than timeout_error.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b848dd11cd04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.