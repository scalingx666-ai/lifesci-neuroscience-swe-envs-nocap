# Issue

**Title:** perf: remove seemingly unnecessary check

## Description

Removing this apparently unnecessary logic saves a frequently called `unordered_map` access. In tests, this could drop several seconds from a 52 second run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e54160a89109`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.