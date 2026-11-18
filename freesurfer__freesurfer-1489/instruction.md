# Issue

**Title:** Bug fixes for dissection_photo_2 GUI

## Description

Fixed two bugs with **dissection_photo_2**
1) GUI would fail when loading nnunet weights for pytorch >=2.6. Changed the loading line to contain the flag weights_only=False.
2) GUI would allow for white-space in project names, breaking its mri_3d_photo_recon wrapper at the end of the GUI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83d686e2f10c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.