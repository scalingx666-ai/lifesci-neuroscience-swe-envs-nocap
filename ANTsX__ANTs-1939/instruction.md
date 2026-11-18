# Issue

**Title:** ENH: antsApplyTransforms vector output compatibility

## Description

antspy requires an itk::VectorImage, and a simple cast doesn't work.

Copying the data is a bit slower but then allows output through the general ANTs::WriteImage function

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e99379cef3a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.