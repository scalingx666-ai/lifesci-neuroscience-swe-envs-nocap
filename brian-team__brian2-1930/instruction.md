# Issue

**Title:** Fix find_name failing if an object is freed while collecting names

## Description

- store the object in a local variable to keep it alive while accessing the name
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a88d9f15fb88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.