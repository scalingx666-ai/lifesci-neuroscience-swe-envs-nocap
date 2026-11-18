# Issue

**Title:** COMP: Update vtkAddon to add scattered B-spline transform

## Description

Updates vtkAddon to add `vtkScatteredBSplineTransform`, a cubic B-spline transform fitted to displacements defined at the points of a surface or volumetric mesh. An upcoming vector field display change uses it to compute transforms from model displacements. Nothing in Slicer uses the class yet, so this update does not change existing behavior.

`GridBoundsMargin` lets the automatic fitting domain extend beyond the bounds of the input points. Within the margin the transform follows the displacements smoothly, instead of switching to the `BorderMode` behavior right at the outermost points. The default margin is 0.

## Changes

```
$ git shortlog 09bff3bdf2..eece7e7c01 --no-merges
Andras Lasso (2):
      ENH: Add vtkScatteredBSplineTransform
      ENH: Add GridBoundsMargin to vtkScatteredBSplineTransform
```

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.