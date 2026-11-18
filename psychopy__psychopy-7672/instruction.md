# Issue

**Title:** PKG: added cryptography as a suggested dep

## Description

This is used by google-api for auth but recent version 49.0 fails to install on macos so hoping that we can fix at 48.0.1 to get build working

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a94cbc23dc25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.