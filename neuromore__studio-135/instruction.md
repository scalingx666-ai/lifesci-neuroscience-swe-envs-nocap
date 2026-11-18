# Issue

**Title:** Added support for tabbed windows.

## Description

Test:
Drag a window to another one, release the mouse = > Make sure it's added as new tab
Drag from the tab title to outside of the tabbed window area => Make sure the window is separated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f54636329468`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.