# Issue

**Title:** SRM: Use per-subject random number generators

## Description

Enables checking the upcoming distributed implementation.

Also, fixes a part of #112.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34f59cdf8341`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.