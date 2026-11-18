# Issue

**Title:** fix: Respect `--cmake-osx-architectures` flag

## Description

Updates the `tools/build.py` file to correctly reference the `--cmake-osx-architectures` flag.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `053376a6c59a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.