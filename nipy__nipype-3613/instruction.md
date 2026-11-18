# Issue

**Title:** [ENH]: Add functions to mrtrix3 interface

## Description

This PR updates the mrtrix3 interface in nipype and closes issue #3612

List of proposed changes:

1. Added "MaskFilter" for dilate/erode filteres
2. Added "MTnormalise"
3. Added "Generate5tt2gmwmi"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1a8909d233e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.