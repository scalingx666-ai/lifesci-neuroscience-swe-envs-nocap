# Issue

**Title:** bugfix in read_neuralynx_ncs

## Description

This PR fixes a bug where NumValidSamp was incorrectly used as a scalar index. Since NumValidSamp is a vector, it needs to be indexed before being used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `107e56ce9c2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.