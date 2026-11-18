# Issue

**Title:** Fix receive buffer overflow

## Description

Add more padding to the receive buffer to prevent consumers of the receive buffer from reading past the end of the allocated space.

See comments in code and commits for details.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `429187f6a7e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.