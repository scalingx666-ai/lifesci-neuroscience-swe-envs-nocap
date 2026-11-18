# Issue

**Title:** [MNT] - Consolidate duplicated IO functionality

## Description

At some point through development / 2.0 work we ended up with duplicated model loader functions. This drops the duplication.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7db02b1712c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.