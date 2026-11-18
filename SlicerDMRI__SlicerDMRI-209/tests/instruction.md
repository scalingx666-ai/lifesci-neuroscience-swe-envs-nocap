# Issue

**Title:** COMP: Use SetNthControlPointPosition instead of SetNthFiducialPosition

## Description

Use `vtkMRMLMarkupsFiducialNode::SetNthControlPointPosition` instead of `vtkMRMLMarkupsFiducialNode::SetNthFiducialPosition`.

Fixes:
```
Warning: In vtkMRMLMarkupsFiducialNode.h, line 132
vtkMRMLMarkupsFiducialNode (0x557af863f8f0):
vtkMRMLMarkupsFiducialNode::SetNthFiducialPosition method is deprecated,
please use SetNthControlPointPosition instead
```

raised when running the `py_NsgPlanTracto` test.

The method was deprecated on Nov 28, 2021 through the Slicer commit:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bbe2cf9ddf7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.