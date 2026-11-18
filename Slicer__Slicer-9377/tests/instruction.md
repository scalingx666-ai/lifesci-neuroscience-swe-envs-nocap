# Issue

**Title:** ENH: Use application display name for macOS pre-warm dialog

## Description

This is a follow-up to  For 3D Slicer custom applications, the application display name should be used for the macOS pre-warm dialog instead of hardcoding to be "3D Slicer".

This is the dialog that was hardcoding "3D Slicer" instead of the 3D Slicer custom application display name:
<img width="525" height="200" alt="wrong-name-macos-startup" src="https://github.com/user-attachments/assets/ceb24a6c-ed38-453c-8a00-6152814e7d22" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `891751aef18c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.