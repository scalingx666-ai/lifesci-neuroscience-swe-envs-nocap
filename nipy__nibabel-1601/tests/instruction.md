# Issue

**Title:** fix: Calculate io_orientation from float64 affine

## Description

It is unclear whether #1512 can be reproduced, but this should have no negative impact on memory, as it is a 128-byte array, and the return type of the function does not change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22338e1f1c9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.