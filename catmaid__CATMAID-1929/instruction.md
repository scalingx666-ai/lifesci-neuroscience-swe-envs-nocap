# Issue

**Title:** Reduce lint noise

## Description

csslint is pure noise on travis, so that is disabled.
JShint now ignores node_modules.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `724b95409177`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.