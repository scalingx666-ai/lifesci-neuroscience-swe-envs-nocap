# Issue

**Title:** Tag Table: Fix off-by-one error

## Description

Previously, when the data was fetched the first instance of a label would create an empty object; the second would start populating it. Now every label instance populates the data object.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0512e7cb92dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.