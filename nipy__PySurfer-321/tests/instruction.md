# Issue

**Title:** FIX cortex parameter:  matplotlib changed error type

## Description

Matplotlib seems to have changed an error type, so some possible values for `cortex’ are not interpreted correctly anymore. Fixed in this simple PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15540266d5df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.