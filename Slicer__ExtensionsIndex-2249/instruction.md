# Issue

**Title:** Add MuscleMap extension (SlicerMuscleMap)

## Description

This pull request adds the MuscleMap extension.

Extension name: MuscleMap
Repository: https://github.com/Eddowesselink/Slicer3D_MuscleMap
Description: Automated whole-body muscle segmentation inside 3D Slicer.
Type: scripted Python extension (no custom C++ libraries).

The extension has been tested locally in Slicer by installing it from source.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80be0c9df991`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.