# Issue

**Title:** [fix] Add shm back to install script

## Description

The `docker-compose.yml` needs shm option since the ACE dataloaders rely on shared memory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c238602939a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.