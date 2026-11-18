# Issue

**Title:** MNT: Add user name and email to Docker to appease git/annex/datalad

## Description

Fixing an apparent datalad 0.15 regression that causes failures if `user.name` and `user.email` aren't set in Docker containers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb125ab10b76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.