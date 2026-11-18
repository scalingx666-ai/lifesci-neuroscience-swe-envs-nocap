# Issue

**Title:** FIX: Add tolerance parameter to ComputeDVARS

## Description

.

Also made some changes to avoid numpy deprecation warnings, and used nibabel 3+ idioms for coercing data types.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c388fae68386`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.