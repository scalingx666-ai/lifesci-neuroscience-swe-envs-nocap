# Issue

**Title:** [MAINT] minimize file changes that can trigger the bootstrap workflow

## Description

(no description provided in source PR)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d79797fef32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.