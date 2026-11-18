# Issue

**Title:** [FIX] ASR: make nonlinear_eigenspace reproducible

## Description

`nonlinear_eigenspace` drew its optimization starting point from an unseeded module-level `np.random.default_rng()`, so the riemann ASR path produced slightly different results on every call. Because the manifold optimizer converges to the same eigenspace regardless of the starting point, this only injected run-to-run numerical noise — but that noise makes the riemann results non-reproducible and destabilizes the incremental-vs-bulk equivalence check in `test_asr_class` (its `< 6µV` tolerance can be exceeded depending on dependency versions and the covariance regime).

Seed the starting point with a fixed value so the riemann path is reproducible run-to-run. The mathematical result is unchanged; only the previously-random initialization is now deterministic.

### Testing
Adds `test_nonlinear_eigenspace_reproducible` asserting repeated calls return identical results (fails on the unseeded code, passes after). Full `tests/test_cov.py` and `tests/test_asr.py` pass; `ruff` clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3721224cf7ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.