# Issue

**Title:** ENH: Run pytest on CircleCI

## Description

We don't currently run tests in an environment with everything installed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `506df71de047`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.