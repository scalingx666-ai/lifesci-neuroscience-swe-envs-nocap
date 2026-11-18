# Issue

**Title:** feat: breaking simplification routine out from get_mesh

## Description

- Adds Mesher.simplify(...)
- Adds Mesher.compute_normals(...)
- Adds Mesh.triangles()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `859063edc231`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.