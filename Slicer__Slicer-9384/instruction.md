# Issue

**Title:** BUG: Update the grid transform before returning its array

## Description

slicer.util.arrayFromGridTransform reads the displacement grid of the node's transform from the parent. If the node stores the transform to the parent, the transform from the parent is its inverse, computed on demand, and it has no displacement grid until it is updated, so the function failed with an AttributeError.

The transform is now updated before its grid is read (also in arrayFromGridTransformModified). The updated inverse shares the stored grid, so the array still gives write access to the node's coefficients. The docstring explains that in this case the array holds the to-parent displacements and points to the transform's inverse flag.

A util test covers both storage directions, including writing through the array and the direction of the resulting transforms.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `147e764b580b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.