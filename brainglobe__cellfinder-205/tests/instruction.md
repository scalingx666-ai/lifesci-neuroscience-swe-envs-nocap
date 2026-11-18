# Issue

**Title:** Don't specify QT backend in requirements

## Description

See https://napari.org/plugins/best_practices.html#don-t-include-pyside2-or-pyqt5-in-your-plugin-s-dependencies as to why this is not a good thing to do.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9132772ea1cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.