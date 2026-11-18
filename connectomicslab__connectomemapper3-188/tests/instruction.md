# Issue

**Title:** FIX: Use PyQt5 to be able to launch `cmpbidsappmanager` on Mac Big Sur

## Description

This PR  by integrating the suggested fix in  that consists of using the latest version PyQt5 instead of PySide2 for graphical backend.

The conda environment files have also been refactor, Pyside2 is not installed anymore, and a number of packages are now installed directly via pip, including PyQt5.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1bc5683a2f4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.