# Issue

**Title:** Handle `state_discontinuity` call in NET_RECEIVE block

## Description

Part 1 of #3591.
The call to `state_discontinuity(A, B)` inside of a NET_RECEIVE block should be converted to the statement `A = B`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31530e238936`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.