# Issue

**Title:** COMP: Prefer using `vtkExtractSelection`

## Description

Prefer using `vtkExtractSelection` over the deprecated `vtkExtractSelectedPolyDataIds`.

Fixes:
```
Modules/Loadable/TractographyDisplay/MRML/vtkMRMLFiberBundleNode.cxx:107:49:
warning: 'vtkExtractSelectedPolyDataIds' is deprecated:
Use vtkExtractSelection instead of vtkExtractSelectedPolyDataIds.
[-Wdeprecated-declarations]

  ExtractSubsample(vtkExtractSelectedPolyDataIds::New()),
                                                ^
```

Raised for example in:
https://slicer.cdash.org/viewBuildError.php?type=1&buildid=3190094

Documentation
https://vtk.org/doc/nightly/html/classvtkExtractSelectedPolyDataIds.html#details

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff5b3409c29b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.