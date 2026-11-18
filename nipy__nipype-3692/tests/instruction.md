# Issue

**Title:** RF: Replace deprecated pkgutil.find_loader with importlib.util.find_spec

## Description

`pkgutil.find_loader` was deprecated in 3.12, will be removed in 3.14, and its replacement has been around since 3.4.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fffc1c2fc271`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.