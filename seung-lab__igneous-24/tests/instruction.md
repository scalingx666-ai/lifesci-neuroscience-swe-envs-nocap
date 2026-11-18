# Issue

**Title:** feat(MeshTask): cache_control and parallel kwargs support

## Description

`cache_control` because I want to see meshes asap in Neuroglancer,
`parallel` because it looks Segmentation Download is the slowest part for quick&dirty meshing without simplification.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96bb51c7ef4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.