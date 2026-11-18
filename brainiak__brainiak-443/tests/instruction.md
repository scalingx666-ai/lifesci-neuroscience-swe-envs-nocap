# Issue

**Title:** dev: Add MPICH as explicit dependency for Conda

## Description

Conda defaults to OpenMPI, which is causing problems in Travis:
https://travis-ci.org/brainiak/brainiak/jobs/609792226

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c11fce4c39e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.