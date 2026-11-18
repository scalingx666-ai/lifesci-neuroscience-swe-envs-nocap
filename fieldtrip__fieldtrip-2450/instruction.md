# Issue

**Title:** ENH - Inside the local copy, the directories should have a specific hierarchy.

## Description

Improved help documentation of `dccpath` to explain to external contributors (that have manually downloaded test data in their computer) how to structure the folders inside their local copy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81b8eb609ab5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.