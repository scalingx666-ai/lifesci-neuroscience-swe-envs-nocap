# Issue

**Title:** ENH: squeeze data_weights if necessary

## Description

This changes helps support some potential existing code that had a 2-dimensional data_weights input.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8cceaedd6aa7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.