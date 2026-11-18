# Issue

**Title:** feat: whole image connected components labeling

## Description

Adds whole image 6-way CCL for segmentations. Currently requires sqlite read/write access (so probably only local or university clusters).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b01aa578da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.