# Issue

**Title:** Python ext build

## Description

Python developers often do not know how to write and test CMakeLists.txt files and so mistakes are often not found until a reviewer actually builds the extension. This pull requests adds quick automatic testing of packaging of Python-only extensions using a mock Slicer-build tree.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36f6ebebccda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.