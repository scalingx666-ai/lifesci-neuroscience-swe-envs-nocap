# Issue

**Title:** Refactor removed trimesh function calls

## Description

`remove_duplicate_faces` and `remove_degenerate_faces` were removed in Trimesh 4.10.
`mesh.update_faces(mesh.unique_faces)` and `mesh.update_faces(mesh.nondegenerate_faces())` are drop-in replacements.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc2d3959a05b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.