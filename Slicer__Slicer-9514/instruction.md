# Issue

**Title:** Speed up DICOM import and add import threads setting

## Description

Changes needed for importing large 4D flow MRI studies (GE and Philips, 5 series × 5400 files) in SlicerHeart: update CTK to speed up DICOM indexing (commontk/CTK#1460), add a DICOM application setting for the number of threads that read files during import, and fix the current build error on main.

## Changes

**COMP: Fix build error in model display node widget**
`main` does not compile since #9509: `qMRMLModelDisplayNodeWidget::updateWidgetFromMRML()` calls `qMRMLModelDisplayNodeWidgetPrivate::currentModelNode()`, which was not added (`error: 'class qMRMLModelDisplayNodeWidgetPrivate' has no member named 'currentModelNode'`, also in the CI build of 9b1f63a5cf). The method is added.

**COMP: Update CTK to speed up DICOM indexing**
- DICOM files are parsed in parallel during indexing (5400-file series: 21.9 s → 5.6 s).
- Tags to precache are stored in upper case, so lower-case tags requested by DICOM plugins are found in the tag cache instead of re-reading the files (24 s → 0.15 s for each such query of a 5400-file series).
- The "Patient ID is empty" warning is logged once per study and import instead of once per file.
- Displayed fields are updated for patients with an empty patient ID or name.

**ENH: Add DICOM import threads setting**
Application settings → DICOM → Generic DICOM settings → Import threads (settings key `DICOM/indexingThreadCount`). The default (0) uses CTK's default: 6 threads, but at most the number of logical processors minus 2. Changes are applied immediately.

The default suits hard disks. SSDs and network drives are faster with more threads. Import time of a 27000-file (4.4 GB) 4D flow study:

| Threads | SSD | Hard disk | Network share |
|---|---|---|---|
| 1 | 185 s | 261 s | 1504 s |
| 6 (default) | 60 s | 160 s | 717 s |
| 18 | 38 s | 172 s | 412 s |

## Testing

- Full Slicer test suite on Windows (Release, Qt 5.15): 711 of 712 tests pass. `qSlicerSslTest` fails with and without these changes.
- CTKDICOMCore tests pass (31 tests).
- Tested in a Slicer build with the merged CTK version: the setting shows "Default (6)", changes are applied to `slicer.dicomDatabase` and saved, a saved value is applied at startup, and imports use the configured number of threads.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f30ea32e8cdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.