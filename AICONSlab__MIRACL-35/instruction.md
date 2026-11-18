# Issue

**Title:** Sta workflow

## Description

Minor Update
- Dockerfile now installs latest version of ANTs, ITK-Snap, Fiji
- Fixed minor bug for registration workflow, where CLI was not referencing current working directory

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3050a6f0bc3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.