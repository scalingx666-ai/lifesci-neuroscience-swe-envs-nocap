# Issue

**Title:** BUG: fix tracts for vtk9

## Description

The behavior of vtkCellArray::GetData changed with vtk9 such
that is now returns a copy of the data rather than the actual
array, so manipulating it has no effect.

Instead now we must have the cell array import the legacy format.

This operation is no doubt slower but is a minimal change to restore
funcationality.  This code should really be threaded and reworked to
use the new API if performance is critical.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `234a4f994379`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.