# Issue

**Title:** chore: Prune Ubuntu environment before building docker images

## Description

Docker builds are suddenly failing for a lack of disk space. Trying out a suggestion in https://github.com/orgs/community/discussions/179725.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4820caf70f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.