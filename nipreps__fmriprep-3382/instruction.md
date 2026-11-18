# Issue

**Title:** Install c3d through conda

## Description

The entire package (14MB) is smaller than the statically linked c3d_affine_tool (116MB).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0addef593af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.