# Issue

**Title:** fix(app): Use recursive: true for native file API downloads

## Description

Simplify native file API downloads to use the recursive flag and fixes the invalid query structure in #3907

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83699d4844c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.