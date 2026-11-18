# Issue

**Title:** refactor: remove preserve_order parameter

## Description

I was mistaken that it was needed in the first place. Marching cubes does iterate over labels in a different order but then it does a hashmap access for each one. The order doesn't matter.

Removing this parameter will improve meshing speed for everyone.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8abf3ce37f1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.