# Issue

**Title:** Changed the Strahler index implementation

## Description

Changed the incrementing behavior in the case of N branches merging.
Previous implementation incremented the index only if all N branches
had the same index.  Now the index is incremented as long as the max
index is shared by at least two merging branches.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22fc3e2e426b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.