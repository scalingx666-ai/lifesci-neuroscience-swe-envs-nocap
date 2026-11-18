# Issue

**Title:** feat(cli): Remove CLI flags with expired deprecation periods

## Description

Pretty straightforward. We said we'd remove these things, and now they're removed. It's been a full year and two minor versions with the deprecation warnings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `556615767d8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.