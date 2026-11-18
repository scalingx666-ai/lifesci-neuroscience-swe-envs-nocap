# Issue

**Title:** Fix Windows installer name in release CI

## Description

This should be the last bugfix for the release CI workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67816852a008`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.