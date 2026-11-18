# Issue

**Title:** CI: Drop v from release versions

## Description

These were originally part of version labels but now we use X.Y.Z not vX.Y.Z. Makes sense to do the same for Dockerhub

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9bd815fa981`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.