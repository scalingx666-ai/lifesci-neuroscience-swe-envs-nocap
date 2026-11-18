# Issue

**Title:** Fixed openmp_error by removing tbb from setup.py

## Description

This PR fixes issue #475. Fresh installs on this branch work fine.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `549650bdfa2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.