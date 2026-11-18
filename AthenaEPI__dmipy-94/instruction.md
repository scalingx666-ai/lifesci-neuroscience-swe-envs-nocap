# Issue

**Title:** Merge pull request #1 from AthenaEPI/master

## Description

Initial implementation of AmicoCvxpyOptimizer class.
It contains sampling of parameter ranges and creation of parameter grids, creation of an observation matrix M (this will be moved to _create_forward_model_matrix in dmipy/core/modeling_framework.py) and the estimation of the vector containing distributions of the parameters

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c246fa7842df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.