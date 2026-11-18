# Issue

**Title:** ENH: Add Scroll mouse mode to browse slices by click-and-drag

## Description

Add a new "Scroll" mouse interaction mode alongside the existing
Translate/rotate view, Adjust window/level, and Place modes.

This is consistent with other radiology viewers (Weasis, OsiriX, etc.)
and an older IHE supplement that many viewers adopted
(https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_BIR_Rev1.3_TI_2016_09-09.pdf),
and users requested (https://discourse.slicer.org/t/is-it-possible-to-scroll-by-dragging-the-mouse-in-the-current-view/35964/4).

A few additional modes (zoom, pan, crosshair) may be considered,
which can be useful when using single-button mouse or touchscreen.

When this new mode is active, click-and-drag vertically in a slice view scrolls through
slices, with the full view height mapped to the full slice offset slider range.

Implementation:
New mode is added to vtkMRMLInteractionNode.
vtkMRMLSliceIntersectionWidget implements the view interaction.
Added new icon (stack with blue up/down arrow) to the toolbar and shortcut to view context menu.

<img width="614" height="511" alt="image" src="https://github.com/user-attachments/assets/99fb0041-bced-4778-9aed-80660a2770ad" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `311cf24b61b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.