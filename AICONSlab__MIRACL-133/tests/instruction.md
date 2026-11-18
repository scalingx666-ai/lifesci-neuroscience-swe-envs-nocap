# Issue

**Title:** [feat] replace shm_size with mem_limit

## Description

Instead of using the -d flag to set the memory size that is shared between containers, the flag now sets the max memory limit for the container itself. For that the script first checks whether the host machine is running Linux or MacOS and uses the appropriate command to set 85% of available memory as a default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66642bfc4237`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.