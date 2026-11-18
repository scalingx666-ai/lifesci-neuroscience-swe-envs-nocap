# Issue

**Title:** fixed logic of maxpolydeg

## Description

- removed "+ 1" logic from places where maxpolydeg is handled in glmsingle.py and glm_estimatemodel.py. now, instead, we include the + 1 logic in make_poly_matrix.py only. this keeps the meaning of maxpolydeg consistent with what is described in the docstring, and consistent between matlab and python implementations

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f83014b13a49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.