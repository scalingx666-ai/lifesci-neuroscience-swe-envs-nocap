# Issue

**Title:** Allow longer github tests.

## Description

Previous tests ran out of time when running tests on macOS, we increase the time limit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e76facc591b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.