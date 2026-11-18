# Issue

**Title:** DOC+TST: test exclude keyword, document parcels

## Description

Using 'exclude' not previously tested.  Rewrite docstring for parcels. Change
exclude argument to be tuple to avoid mutable default argument.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfc99f8a2d9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.