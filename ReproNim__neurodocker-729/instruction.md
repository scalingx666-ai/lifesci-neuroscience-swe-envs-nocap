# Issue

**Title:** Fix escape of pip install block in miniconda recipe

## Description

Escape pip install block of miniconda recipe with single quotes instead of double to avoid bash substitution and capture of '>' and '<' chars.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8d67be5f47c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.