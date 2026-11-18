# Issue

**Title:** Build/faster linker

## Description

- Adds CMake infrastructure to use `mold`/`lld` if available by default, if not will fallback to `ld` for linking

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee5edcf83ef0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.