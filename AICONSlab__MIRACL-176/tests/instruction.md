# Issue

**Title:** [hotfix] fix hardcoded default value for label voxel size/resolution

## Description

The voxel size/resolution for the tiff labels was hardcoded to 10um for tiflblsdim which gets the image dims. This would break tiff creation in reg_final for different voxel sizes e.g. 50um.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16a65d60699e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.