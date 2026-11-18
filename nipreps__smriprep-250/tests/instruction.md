# Issue

**Title:** CI: Use separate fallback cache for maint/0.7.x

## Description

Changes in the working directory in master are causing reuse problems here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2495cf530612`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.