# Issue

**Title:** feat(models): run wide ridge designs in Himalaya's kernel form

## Description

## Summary

`_Ridge` always ran Himalaya's primal (feature-space) solvers. Himalaya's [flowchart](https://gallantlab.org/himalaya/flowchart.html) routes designs with more features than samples to its kernel-form estimators instead, and Himalaya does not switch on its own: its primal solvers only warn, and the adapter suppressed that warning. Wide feature matrices, single or banded, are a common encoding-model workflow, and they paid roughly `n_features / n_samples` more per alpha per fold in the cross-validation loop.

The adapter now switches for the user. Nothing user-facing changes except one new fitted attribute.

## What changed

- `_solver_form(n_samples, n_features)` picks `"kernel"` when the total feature count exceeds the sample count, `"primal"` otherwise and on ties. `fit` records the choice as `solver_form_`.
- `fit` dispatches on `(is_banded, solver_form_)`:
  - ordinary wide → `solve_kernel_ridge_cv_eigenvalues` on the linear kernel; `coef_ = X.T @ dual` in the working dtype, stored as float64
  - banded wide → `solve_multiple_kernel_ridge_random_search` over one linear kernel per space with `return_weights="primal"`, so Himalaya returns `coef_` already in feature coordinates
- Kernels are built inside the same scoped Himalaya backend as the solve, so they live on the device that consumes it. No CPU fallback path exists.
- `_batch_sizes` takes a `solver_form` keyword and sizes the kernel form from sample-by-sample working sets. `backends.py` is untouched.
- The fixed-alpha fit and every bootstrap replicate still run `solve_ridge_svd`.
- Input conversion and fitted-state recovery are shared across the four fit methods (`_to_backend_arrays`, `_store_ordinary_state`, `_store_banded_state`).
- `development/specs/ridge.md` and `development/ridge-internals.md` describe the rule, the solver table, the kernel working-set shapes, and the dual-to-primal recovery.
- `.superpowers/` (local planning artifacts) is now ignored.

## Tests

Ten added or changed tests in `test_ridge.py` and `test_braindata_bootstrap.py`, each comparing the adapter against a direct Himalaya call rather than re-deriving the math: the shape rule, kernel-form batch sizing, routing for wide ordinary, wide banded, tall, and fixed-alpha fits, parity of `coef_`, `alpha_`, `cv_scores_`, and `feature_space_weights_` between the two forms, float32 recovery, backend restoration when the kernel solver raises, and a wide banded bootstrap reaching the shared refit.

`uv run poe ok` passes on every commit.

## Notes for review

- Where two candidate alphas tie in cross-validation score at working precision, the two forms may snap to different grid points; coefficients and scores still agree to that precision. The spec says so.
- Himalaya's "slower than kernel ridge" warning stays suppressed on the primal calls, which are now only reached when it would not fire.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d51835ffc925`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.