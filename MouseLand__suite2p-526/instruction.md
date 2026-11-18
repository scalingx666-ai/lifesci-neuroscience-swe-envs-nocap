# Issue

**Title:** Add Ubuntu Bionic to monitored environments for Travis

## Description

.

This pull request includes Ubuntu bionic but allows it to fail, the same way the macOS is currently allowed to fail.  While not a complete fix, it provides a way to monitor the environment and give us insights on potential problems, should they arise for users.

Best wishes,

Nick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab0d223ec7cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.