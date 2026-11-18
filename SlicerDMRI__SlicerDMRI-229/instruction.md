# Issue

**Title:** BUG: handle scalar colors when fibers are unstructured grid

## Description

Since a vtkMRMLModelNode can be either a vtkPolyData or a vtkUnstructuredGrid, use the generic GetMesh method to set the value for the scalar selection combobox.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c4b00b1ea07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.