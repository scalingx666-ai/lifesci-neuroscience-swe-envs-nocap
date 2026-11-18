# Issue

**Title:** BUG: refactor vtk class memory allocation

## Description

vtkNew allocates pointers to vtk class instances on the stack, so they are freed when the variables go out of scope.  This led to crashes when trying to use them from other methods.

This no allocates class instances consistently so they can be re-used safely and only deleted when the node is freed up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a19dfc35d338`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.