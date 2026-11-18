# Issue

**Title:** [FIX] Fix unbound variable in SLM

## Description

Fixes an issue where an SLM without a mask would have an unbound variable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `455dd8708559`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.