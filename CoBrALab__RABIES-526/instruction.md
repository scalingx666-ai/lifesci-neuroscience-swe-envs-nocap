# Issue

**Title:** Run 3dDespike with -nomask to stop it zeroing voxels outside AFNI's a…

## Description

…utomask. The old implementation without -nomask could inadvertently replace meaningful low-intensity voxels with zeros, creating gaps in real tissue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21ec8439434c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.