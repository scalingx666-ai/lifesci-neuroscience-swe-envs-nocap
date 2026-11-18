# Issue

**Title:** perf: reduce average memory pressure from meshing

## Description

The initial marching cubes mesh produces a large spike in memory usage,
but we can reduce that as mesh simplification proceeds by deleting
already simplified meshes. This can help reduce the overall memory
pressure on an instance when the tasks are desynchronized.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f3a19e74987`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.