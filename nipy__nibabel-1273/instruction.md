# Issue

**Title:** MNT: Update test dependencies for 3.12 and dev environments

## Description

`indexed_gzip` has 3.12 wheels now, and we should go ahead and check for interactions with numpy 2-dev for all optional dependencies.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5d44230454a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.