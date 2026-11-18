# Issue

**Title:** Better error message when Python lib is not found

## Description

Fix #3649.

No test because I would need to setup a whole CI for this (all other CIs have Python built-in, so come with libpython in one form or another).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ad3271f7717`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.