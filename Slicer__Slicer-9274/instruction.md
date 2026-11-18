# Issue

**Title:** BUG: Fix lock button not hiding ROI interaction handles

## Description

When a markups ROI node was locked via the lock button, the scale/rotate/translate interaction handles remained visible and interactive. Fix by:
- Overriding CanInteract() in vtkSlicerMarkupsInteractionWidgetRepresentation to respect the node-level locked state
- Returning false from IsDisplayable() when the node is locked so handles are hidden
- Calling SetLocked() when the per-control-point lock icon is clicked in the table

Slicer 5.12.0:

https://github.com/user-attachments/assets/9e7347c4-670b-493c-8298-011b9c85f602


This PR:

https://github.com/user-attachments/assets/984bf1a4-4581-4f0d-a6d5-cfc7038b6369

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9f8aff58bf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.