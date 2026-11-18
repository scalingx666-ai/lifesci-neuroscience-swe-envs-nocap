# Issue

**Title:** Toggle between centroid and surface point selection (for IsoSurface)

## Description

This PR allows users to switch between centroid/surface point selection while selecting a point in the IsoSurface (addresses point # 10 in PR #732).

> Shortcut to switch between center and non-center selection of 3D contacts

~Proposed~ Final GUI (button) in iEEG panel :
![Screenshot 2025-04-17 151849](https://github.com/user-attachments/assets/fcf048f9-dc93-437f-8ecd-37454413e6ec)

~Proposed~ Final menu item (checkboxmenuitem) when user right clicking on the 3D figure (shows up only when the `Select` button is pressed in iEEG panel and IsoSurface is loaded):
![Screenshot 2025-04-17 151859](https://github.com/user-attachments/assets/8f443703-b82d-4321-b27e-1f3aac5d3674)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ff1f2384ddd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.