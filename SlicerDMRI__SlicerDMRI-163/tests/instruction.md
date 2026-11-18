# Issue

**Title:** Fix registration of Tractography displayable manager and remove support for Qt4 and Slicer 4

## Description

Ensures the displayable manager is registered when the extension
is built against Slicer >=5. It removes the conditional check originally
introduced in 45eceb180 (Ensure displayable manager are registered with Slicer >= 4.9).

Runtime error fixed is the following:

```
  Generic Warning: In /path/to/Slicer-Release/VTK/Common/Core/vtkDebugLeaks.cxx, line 272
  Deleting unknown object: vtkMRMLTractographyDisplayDisplayableManager

  Warning: In /path/to/Slicer/Libs/MRML/DisplayableManager/vtkMRMLDisplayableManagerFactory.cxx, line 136
  vtkMRMLThreeDViewDisplayableManagerFactory (0x55b6315a8dd0): RegisterDisplayableManager - vtkMRMLTractographyDisplayDisplayableManager is not a displayable manager. Failed to register
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `414ba88b8b2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.