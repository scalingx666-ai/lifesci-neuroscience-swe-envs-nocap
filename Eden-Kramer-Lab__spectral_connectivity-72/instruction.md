# Issue

**Title:** Replace direct matrix inverse with Tikhonov-regularized solve for MVAR Fourier

## Description

## Summary

- Replace direct matrix inverse with Tikhonov-regularized solve in MVAR Fourier coefficient computations
- Add scale-aware regularization parameter: λ = 1e-12 * mean(||H||²)
- Add stress test for near-singular frequency bins

## Test plan

- [x] New stress test `test_mvar_regularized_inverse_near_singular` passes
- [x] All existing MVAR/Granger causality tests continue to pass
- [x] Directed connectivity measures (DTF, etc.) work with near-singular inputs
- [x] No LinAlgError exceptions thrown for highly correlated signal inputs

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e4928754bd6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.