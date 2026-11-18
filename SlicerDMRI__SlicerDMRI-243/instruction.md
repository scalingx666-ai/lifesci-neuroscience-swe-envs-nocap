# Issue

**Title:** ENH: Do not require git to install conversion package

## Description

Use the github release link to pip install the python dependency needed for loading nifti files

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f75e22f411c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.