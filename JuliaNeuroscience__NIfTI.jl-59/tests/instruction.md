# Issue

**Title:** Add docstrings for exported functions and types

## Description

Added docstrings for the exported functions and types. This should make the package a bit more friendly to use, since currently the only way to access much of the documentation is by looking at the source comments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78aee478d2c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.