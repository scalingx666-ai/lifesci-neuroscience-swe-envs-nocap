# Issue

**Title:** ENH: Do not `try`/`except` on non-optional imports

## Description

Do not `try`/`except` on non-optional imports.

Also, raise an exception if the corresponding option is not found.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afcb30b319e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.