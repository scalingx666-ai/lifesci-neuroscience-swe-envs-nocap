# Issue

**Title:** Add an autodiff fallback for CBMR's closed-form information matrix

## Description

## Summary
- #1121 replaced automatic differentiation of the CBMR log-likelihood with closed-form Hessian formulas for a large speedup. Those formulas were derived and implemented with LLM assistance, and are checked only against symbolic proofs and a limited set of numerical comparisons (https://github.com/jdkent/cbmr-proofs) rather than independent validation.
- This PR keeps the closed form as the default (it's the right default for most users), but adds `information_method="autodiff"` to `CBMR(...)` so a cautious caller can fall back to the original, slower and more memory-intensive `torch.func.hessian` computation CBMR used before #1121.
- The default path now logs a warning the first time a fit actually uses a closed form, naming the PR, the proofs repo, and the fact that it hasn't been independently or exhaustively validated, so results produced with it can't be mistaken for fully vetted.
- Scope: only the information-matrix derivation is gated. The covariance-inversion dispatch #1121 also added (block-diagonal/bordered inversion, eigensolver-based condition numbers) rests on standard, textbook linear-algebra identities rather than a bespoke derivation, and is already cross-checked against a dense inverse in the existing test suite, so it isn't included in the fallback.

## Test plan
- [x] `pytest` on all CBMR test modules (300 passed, 1 pre-existing skip)
- [x] New tests: invalid `information_method` is rejected, the closed-form warning fires exactly once per model and never under `"autodiff"`, and `"autodiff"` reproduces the closed-form result on the same fitted coefficients (both at the `CBMRModel` level and end-to-end through `CBMR`)
- [x] `black --check`, `flake8` on changed files

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Provide an opt-in automatic-differentiation fallback for CBMR information matrices while retaining the faster closed-form calculation as the default.

New Features:
- Add an `information_method` option to CBMR and CBMRModel, allowing callers to choose between the default closed-form information matrix and the automatic-differentiation implementation.

Enhancements:
- Warn once when a fitted model uses the closed-form information calculation, highlighting its limited independent validation and documenting the autodiff alternative.
- Validate unsupported information-method values during model construction.

Documentation:
- Document the information-method options, validation caveats, and performance trade-offs.

Tests:
- Add coverage for method validation, warning behavior, option propagation, and agreement between closed-form and autodiff information matrices.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `857d51ab8a76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.