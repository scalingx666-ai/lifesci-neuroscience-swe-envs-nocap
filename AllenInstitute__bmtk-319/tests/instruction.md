# Issue

**Title:** Gap junction resistance really means resistance

## Description

The argument `resistance`  in function `add_gap_junction` was used as conductance for gap junctions. Correct the misleading argument name and add an argument to specify conductance directly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62f91693ba0c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.