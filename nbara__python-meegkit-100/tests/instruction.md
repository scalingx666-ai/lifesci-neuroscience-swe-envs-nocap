# Issue

**Title:** [FIX] riemann ASR eigpair mismatch in nonlinear_eigenspace

## Description

## Summary
- fix issue #99 by returning eigenvalues consistent with optimized eigenvectors in nonlinear_eigenspace
- compute eigenvalues from Rayleigh quotients of the optimized basis (diag(X.T @ L @ X))
- add regression test to ensure returned eigenvalues match returned eigenvectors

## Why
The previous implementation returned eigenvalues from a random-initialization matrix (S0) but eigenvectors from the optimizer solution (Xsol.point), producing mismatched eigpairs and unstable component ordering in riemann ASR.

## Validation
- reproduced issue behavior before fix (riemann selecting clean channels)
- after fix, reproduced expected behavior (no inverted channel selection)
- tests run:
  - tests/test_cov.py::test_nonlinear_eigenspace_consistent_eigpairs
  - tests/test_asr.py with riemann-focused selection

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72054a4d7323`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.