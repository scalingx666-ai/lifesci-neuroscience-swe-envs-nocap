# Issue

**Title:** BUG: Index every mesh for picking, not only poly data

## Description

`vtkMRMLAccuratePicker` only built a cell locator for actors whose mapper was a `vtkPolyDataMapper`. Slicer draws unstructured grid models with a `vtkDataSetMapper`, so picking on those models fell back to the unindexed linear scan. On large volumetric meshes (for example an 8.5M-cell CFD mesh), every mouse move took hundreds of milliseconds.

This change takes the data set from any `vtkMapper`, the same way `vtkCellPicker` does, so the locator cache key becomes `vtkDataSet*` instead of `vtkPolyData*`. `vtkStaticCellLocator` already supports any `vtkDataSet`, so nothing else in the design changes.

Measured over a 1M-cell unstructured grid:

| | Before | After |
|---|---|---|
| Unstructured grid (1M cells) | 56.5 ms/pick | 0.02 ms/pick |
| Poly data surface (1.6M cells) | 0.42 ms/pick | 0.38 ms/pick |

`vtkMRMLAccuratePickerTest` now covers both mapper types and fails without the fix.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d32f6cdabd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.