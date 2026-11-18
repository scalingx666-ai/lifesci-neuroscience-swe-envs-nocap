# Issue

**Title:** perf: scale up CCL

## Description

Changes implementation of CCL to omit the need for a SQL database, enabling better scaling behavior and simpler deployment.

I also add the ability to apply a threshold to binarize continuous data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c59ec6404ff7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.