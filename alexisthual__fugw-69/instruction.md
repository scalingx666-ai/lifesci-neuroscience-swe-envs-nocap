# Issue

**Title:** [FIX] Improve CI speed by explicitely installing torch cpu only

## Description

Speeds up the CI runtime by explicitely installing the cpu-only version of torch and not the cuda libraries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1063cd6c43c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.