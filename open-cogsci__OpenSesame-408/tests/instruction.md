# Issue

**Title:** Fix crash on Open Experiment

## Description

When pressing Cancel on the Open File dialog, or opening of some experiments (it doesn't always occur... weird) OpenSesame crashed. This is because it expected the path variable to be a string, while in Qt5 the QFileDialog.getOpenFileName returns a tuple instead of a string. The first position of this tuple contains the expected value for path.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36b983f5bd1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.