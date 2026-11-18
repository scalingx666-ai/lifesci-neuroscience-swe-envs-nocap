# Issue

**Title:** fix(worker): Fix incorrect path resolution in set_remote_public

## Description

Fixes a bad call in set_remote_public and adds basic test coverage for this function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68b32039b1f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.