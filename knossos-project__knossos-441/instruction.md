# Issue

**Title:** Disable node editing in review mode

## Description

Can select nodes or change active node.

Tree edits still possible, e.g. merging, moving nodes between trees.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76408a8d2c6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.