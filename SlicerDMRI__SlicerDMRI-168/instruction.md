# Issue

**Title:** ENH: Use `SetVisibility2D` instead of `SetSliceIntersectionVisibility`

## Description

Use `SetVisibility2D` instead of `SetSliceIntersectionVisibility` to toggle tractography tubes' 2D slice intersection visibility.

Fixes:
```
[VTK] Warning:
In /work/Stable/Slicer-0/Libs/MRML/Core/vtkMRMLDisplayNode.cxx, line 996
[VTK] vtkMRMLFiberBundleTubeDisplayNode (0x73bd250):
SetSliceIntersectionVisibility method is deprecated, please use SetVisibility2D instead
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a685b5e6b9fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.