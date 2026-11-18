# Issue

**Title:** BUG: Fix syntax errors raised after introducing f-strings

## Description

Fix syntax errors raised after introducing f-strings.

Fixes:
```
SlicerDMRI-build/inner-build/lib/Slicer-5.7/qt-scripted-modules/DICOMDiffusionVolumePlugin.py, line 115
    loadable.tooltip = f"Matches DICOM tags for the following vendor(s): {', '.join(matchingVendors)}")
                                                                                                      ^
SyntaxError: unmatched ')'
```

and
```
SlicerDMRI-build/inner-build/lib/Slicer-5.7/qt-scripted-modules/TractographyExportPLY.py, line 306
   self.delayDisplay(f"Test caused exception!\n"{str(e)}")
                                                ^
SyntaxError: invalid syntax
```

raised for example at:
https://github.com/SlicerDMRI/SlicerDMRI/actions/runs/7130356243/job/19416548387#step:8:541 https://github.com/SlicerDMRI/SlicerDMRI/actions/runs/7130356243/job/19416548387#step:8:559

Introduced inadvertently in commit 56b282f.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `122a3e5d1f02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.