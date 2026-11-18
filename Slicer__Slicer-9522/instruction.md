# Issue

**Title:** BUG: Set the type display name of vector volumes in the constructor

## Description

Sets the type display name of `vtkMRMLVectorVolumeNode` in its constructor instead of in `WriteXML`.

The name was only set when the node was written, so a vector volume was not named as one until it was saved. Node selectors show the name of the registered node, which is never written, so they did not show it at all.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.