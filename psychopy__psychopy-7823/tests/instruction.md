# Issue

**Title:** fix: Update JS translation to work in Python 3.14

## Description

ast.Str was queued for deprecation for a while and was finally been removed in 3.14, so we need to stop using it and instead check for `ast.Constant` then check the type of `.value`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c0b814a02bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.