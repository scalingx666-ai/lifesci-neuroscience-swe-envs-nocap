# Issue

**Title:** DOC: Fix CLI module documentation errors

## Description

A translator of 3D Slicer reported error in the help string of one of the BRAINS modules: https://hosted.weblate.org/translate/3d-slicer/3d-slicer/en/?checksum=a076fdd1d6ae84a4#comments

This PR fixes the reported problem and other grammar errors that Claude Code found.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ced799adb12d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.