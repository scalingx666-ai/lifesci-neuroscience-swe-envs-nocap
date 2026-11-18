# Issue

**Title:** feat: compute cross sectional area for vertices

## Description

Adds `kimimaro.cross_sectional_area` which can be used as a post-processing method to compute the cross sectional area for each vertex. The sectioning plane is defined by a normal vector, that vector is the difference between the current and next vertex.

The normals can be smoothed using a windowed averaging function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf0de206b2af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.