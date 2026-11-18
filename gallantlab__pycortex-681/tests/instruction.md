# Issue

**Title:** FIX: fix minor bug in handling of vmin and vmax

## Description

replaces old `cast` code when vmin and vmax are not specified

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d95a27258c07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.