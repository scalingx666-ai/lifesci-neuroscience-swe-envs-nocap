# Issue

**Title:** Update CI

## Description

- only check pushes and pull requests to master, thus reducing number of checks
- remove travis.yml

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99408e7b1c71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.