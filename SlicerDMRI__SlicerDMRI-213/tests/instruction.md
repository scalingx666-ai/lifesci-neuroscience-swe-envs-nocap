# Issue

**Title:** BUG: Fix input scene update in `vtkMRMLFiberBundleNodeTest1`

## Description

Fix `vtkMRMLCameraNode::GetActiveTag()`  warning raised when running the `vtkMRMLFiberBundleNodeTest1`. Apply the following changes to the MRML scene file used by the test:
- Remove the obsolete `active` attribute from `Camera` element.
- Add `singletonTag="1"` before `attributes="MappedInLayout:1"` in the `View` element.
- Add `layoutName="1"` before `layoutLabel="1"` in  the `View` element.

Fixes:
```
vtkMRMLCameraNode.cxx:405   WARN| vtkMRMLCameraNode (0x55d39e09e730):
vtkMRMLCameraNode::GetActiveTag() is deprecated.
Use vtkMRMLCameraNode::GetLayoutName() instead.
```

Following


.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `372675b96e91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.