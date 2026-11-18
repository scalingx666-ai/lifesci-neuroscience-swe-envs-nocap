# Issue

**Title:** bf: Fix reading VTK Version 3.0 files

## Description

The VTK Version 3.0 surface files do not include "vtk output" in the file header. Instead, "surface file" is included. 

This very simple fix enables opening VTK Version 3.0 surface files without manually editing the file headers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b47b83dbb2ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.