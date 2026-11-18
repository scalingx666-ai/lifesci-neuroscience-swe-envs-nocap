# Issue

**Title:** Allow TensorStore configs to exist without metadata. This is necessary for the subvolume processing machinery to populate it programmatically.

## Description

Allow TensorStore configs to exist without metadata. This is necessary for the subvolume processing machinery to populate it programmatically.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e056391d04ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.