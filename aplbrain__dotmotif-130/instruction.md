# Issue

**Title:** fix: enforce json rules on edge and not on node

## Description

JSON attributes are now mapped to the Neuprint edge objects. Previously, the constraints were incorrectly mapped to node objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50515a647814`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.