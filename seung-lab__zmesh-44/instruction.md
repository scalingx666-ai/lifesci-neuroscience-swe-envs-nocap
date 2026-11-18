# Issue

**Title:** feat: chunk_mesh

## Description

- Adds `zmesh.chunk_mesh` which can cut a mesh into many meshes along a grid. This is useful for multi-resolution meshing.
- Adds `mesh.remove_unreferenced_vertices`, `mesh.merge_close_vertices`, and `mesh.remove_degenerate_faces`

The new algorithm appears to give similar quality results to the existing trimesh based algorithm at much higher speed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16a476d8254f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.