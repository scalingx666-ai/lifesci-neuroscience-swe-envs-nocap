# Issue

**Title:** On volume contact sheet, show each dipole only on nearest slice

## Description

Previously dipoles were on every slice which was difficult to interpret.

The issue was mentioned here:
https://neuroimage.usc.edu/forums/t/dipole-mri-viewer-contact-sheet-error/47730

Before:
<img width="600" alt="before_axial" src="https://github.com/user-attachments/assets/b2004064-8caa-4efe-a781-f0c61ace3b11" />

After:
<img width="600" alt="after_axial" src="https://github.com/user-attachments/assets/2f9a54fd-8580-440d-b817-c7a7b687facd" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ae964f0df53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.