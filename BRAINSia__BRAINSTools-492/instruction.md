# Issue

**Title:** ENH: updated external packages to latest version

## Description

Each external package was checked and updated to its latest version if needed.
The following were updated: ANTs, ITK, OpenJPEG, VTK.
The VTK component naming convention changes and required a few other files to be modified.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d702cd70bfab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.