# Issue

**Title:** Remove stuff that was deprecated since 0.8.0

## Description

Should be safe to take them out at this point,
considering that they were hard-deprecated in 0.8 and 0.9.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `963972ef51e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.