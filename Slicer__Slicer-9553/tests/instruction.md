# Issue

**Title:** COMP: Update vtkAddon for model-based transforms

## Description

List of changes:

$ git shortlog eece7e7c01..d7e2cf4f9e --no-merges
Andras Lasso (4):
      COMP: Build and test on Linux, Windows and macOS in GitHub Actions
      ENH: Add vtkMeshDisplacementTransform
      ENH: Add border falloff to vtkScatteredBSplineTransform
      ENH: Add InputPointSetSourceKey to model-based transforms

ferdymercury (2):
      ENH: Avoid double negation variable
      ENH: Development install instructions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `227b8865655f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.