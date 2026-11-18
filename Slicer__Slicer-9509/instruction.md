# Issue

**Title:** ENH: Merge coincident points when displaying volumetric meshes

## Description

When a volumetric mesh (unstructured grid) is displayed semi-transparent, many internal surfaces may appear. This happens when neighbor cells do not share points, for example along boundaries between mesh partitions that a simulation software exported separately. The surface is made of cell faces that are not shared with other cells, therefore the common faces of such cells are displayed, too.

For example, a CFD fluid mesh with 8.5M tetrahedra had 1,621,343 points but only 1,398,349 unique point positions. Its displayed surface consisted of 998,446 triangles instead of 161,390.

This PR adds a "Merge coincident points" option to `vtkMRMLModelDisplayNode`:
- Points of unstructured grid meshes that have exactly the same position are merged (`vtkStaticCleanUnstructuredGrid`, about 0.1 s for the mesh above) in the display pipeline. The model data is not changed. Surface (polydata) meshes are not affected.
- Enabled by default, saved in the scene (`mergeCoincidentPoints`).
- Can be changed in Models module / 3D Display / Advanced. Only shown for volumetric meshes.

Tested with `vtkMRMLModelDisplayNodeTest1` (two tetrahedra with duplicated points of their common face).

<img width="1062" height="948" alt="image" src="https://github.com/user-attachments/assets/f0dd66ca-2a04-4219-bf35-f5ad77f5b159" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0e58137cedf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.