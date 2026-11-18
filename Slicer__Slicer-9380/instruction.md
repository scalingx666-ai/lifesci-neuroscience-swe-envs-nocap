# Issue

**Title:** ENH: Use application display name for macOS bundle

## Description

The application name in the macOS menu bar will now use the application display name such as "3D Slicer" which matches the already used application display name in the window title area.

Current observation with `main` code where the application display name is not in use in the menu bar:
<img width="223" height="79" alt="image" src="https://github.com/user-attachments/assets/93499d5c-c671-4652-88e4-8a5365cb15de" />

With this PR, both places (menubar and window title) appropriately use the application display name.

Note that I originally observed this issue while working on my 3D Slicer custom application where I observed it wasn't using the application display name in the menu bar location.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aaf26e2ea39f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.