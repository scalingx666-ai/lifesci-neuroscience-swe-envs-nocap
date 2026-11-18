# Issue

**Title:** Python OrthView process (ex-Matlab helper)

## Description

NEW:

Matlab OrthView helper was transfered to Python.
Python OrthView process is parallel and initialized during setup.
It uses 2 shareable dictionaries for communication between main and orthview process.

OpenCV library is used for contour detection.
Python adaptation of SPM functions is used (python-rtspm library).

GUI interaction speed slightly increased. The core data processing remains rather unaffected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6832e2c79296`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.