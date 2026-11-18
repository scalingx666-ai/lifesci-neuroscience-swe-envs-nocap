# Issue

**Title:** BUG: Update inverse B-spline transforms before converting them to ITK

## Description

Fixes conversion of an inverse B-spline transform to ITK.

An inverse `vtkBSplineTransform` gets its coefficients from the forward transform when it is updated. `vtkITKTransformConverter` read the coefficients without updating the transform first. So converting the transform from parent of a B-spline transform that is stored as transform to parent found no coefficients.

The converter now calls `Update()` before it reads the coefficients, in both the ITKv3 and ITKv4 code paths.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.