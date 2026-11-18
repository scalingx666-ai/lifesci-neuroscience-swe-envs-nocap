# Issue

**Title:** Make eval suite an optional dependency

## Description

This avoids a circular dependency when installing.

TODO: maybe there is a better way to handle this

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c21e4bf603b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.