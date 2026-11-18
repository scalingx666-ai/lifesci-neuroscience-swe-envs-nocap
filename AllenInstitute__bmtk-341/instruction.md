# Issue

**Title:** Made use of numba optional to prevent conflicts with NEST simulator

## Description

Having numba installed by default was causing issues with the unit-tests and running the examples using NEST. For some reason that I haven't been able to figure out, importing numba causes the NEST library to seg-fault (at-least with the conda-forge build of 3.0-3.3).

Decided to make using numba in FilterNet optional, and if not installed will default back to the old dot-product implementation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b07c06ef9a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.