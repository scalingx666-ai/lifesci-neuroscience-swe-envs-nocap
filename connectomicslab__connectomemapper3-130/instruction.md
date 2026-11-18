# Issue

**Title:** FIX: Adjust the implementation of the python wrappers

## Description

- Review the generation of the command
- Add a new parser argument "--config_dir" to specify and map/bind it inside the container

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9e2bd7cf9d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.