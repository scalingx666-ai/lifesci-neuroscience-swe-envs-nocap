# Issue

**Title:** fix(MeshTask): _update_vertices() accounts for low_padding offset

## Description

Using a `low_padding` value greather than 0 for a `MeshTask` introduces an additional voxel offset that we need to compensate for when calculating the final vertex positions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fb7ca12447d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.