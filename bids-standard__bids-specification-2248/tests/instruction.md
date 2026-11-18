# Issue

**Title:** fix: Get TSV tables rendering again

## Description

#2240 broke TSV builds due to an issue with `@contextlib.contextmanager`-built context managers. This replaces it with a normal context manager.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d0f1c6d1ade`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.