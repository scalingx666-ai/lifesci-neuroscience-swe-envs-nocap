# Issue

**Title:** fix how cogat api results are dealt with.

## Description

Calls to get a single task no longer return an array with a single object, instead just return the object itself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f48cf20b493e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.