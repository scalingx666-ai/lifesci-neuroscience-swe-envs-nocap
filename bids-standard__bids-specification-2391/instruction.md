# Issue

**Title:** chore(tox): Fix environment to avoid pre-release tests

## Description

Slight misconfiguration is resulting in pre-release tests getting run in jobs that are intended to run only locked dependencies.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54c272ca603e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.