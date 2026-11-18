# Issue

**Title:** Repeated Buffer Passes

## Description

Fixed an edge case of models that change buffer tensors during the forward pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98e9fd1ac778`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.