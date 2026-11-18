# Issue

**Title:** BUG: Fix editing of segment opacity by double-click in segments table

## Description

Since the visibility/color button rework (94ad4fb3e8), the DoubleClicked edit trigger is disabled in the segments table (double-click on the name and color columns opens the terminology selector instead), which left F2 as the only way to edit the opacity column.

Open the opacity editor explicitly from the double-click handler to restore the previous behavior.

Fixes https://discourse.slicer.org/t/opacity-cell-5-12-2/47652

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc009bc74665`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.