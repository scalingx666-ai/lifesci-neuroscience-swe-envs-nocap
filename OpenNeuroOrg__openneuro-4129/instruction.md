# Issue

**Title:** fix(worker): Use Redis connection arguments in common/redis client setup

## Description

Use the same Redis connection arguments for both worker containers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d397dcd6ca3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.