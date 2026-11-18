# Issue

**Title:** Moved dissection_photo_gui.sh wrapper down one level, updated CMake files

## Description

Moved the script and install command so that the wrapper would not be installed if the GUI fails to build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f23d06fcd3c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.