# Issue

**Title:** Extract Granger and multivariate kernels from connectivity.py

## Description

## Summary

Last of the post-#79 cleanup PRs; now based on `master`. `connectivity.py` held the `Connectivity` class plus about 1,700 lines of array-level kernels. This PR moves the kernels into their own modules, finishes the split where the class still ran kernel loops, and fixes two problems the review found: warnings that pointed inside the package, and non-reproducible global coherence.

### What moved (bodies unchanged)

| Module | Contents |
|---|---|
| `_granger.py` (774 lines) | VAR model from the spectrum; the spectral Granger family (pairwise, subset, conditional, blockwise) with its NaN-pair warning; `_zero_lag_coefficient` (from #88). New: `_factorize_spectrum`, `_var_model_from_factor`, and the conditional and blockwise pair loops |
| `_multivariate.py` (681 lines) | Canonical coherence/coherency, MIC, global coherence, and both global-coherence tuning constants. New: `_global_coherence`, which decides between the batched and per-bin paths |
| `_array_utils.py` (159 lines) | `_regularized_inverse`, `_batched_inverse_square_root`, `_squared_magnitude`, `_complex_inner_product`, `TIKHONOV_REGULARIZATION_FACTOR` |

- `connectivity.py` goes from 6,734 to 5,368 lines. `Connectivity` keeps validation, caching, and the user-facing warnings, and imports the kernels back.
- The small DTF/PDC, phase-slope/delay and significance-cluster helpers stay in `connectivity.py`; only the class uses them.

### Beyond the move
- **One factorization binding.** `Connectivity`'s cached full model and every reduced, pairwise and block model now factorize, and estimate their transfer function and noise covariance, through `_granger`.
  - Before, patching or instrumenting one module reached only half the calls.
  - The VAR model is cached once; `_transfer_function` and `_noise_covariance` read from it.
- **Warnings name the user's line.** A new `utils.stacklevel_outside_package()` returns the level of the first frame outside the package. It steps over the `functools`/`contextlib` frames of cached properties and decorators. It replaces every hand-counted `stacklevel` in `connectivity.py`, `_granger.py` and the Wilson factorization.
  - Before, 8 of 9 probed `Connectivity` warnings pointed inside the package. Examples:
    - `coherence_magnitude`'s single-observation warning;
    - the zero-power and zero-magnitude warnings;
    - `partial_coherence`'s few-observations warning;
    - every Granger NaN-pair warning reached through `multitaper_connectivity`.
  - Wrong attribution also defeated per-module warning filters.
- **Global coherence's per-bin path is reproducible.** SciPy's `svds` (ARPACK) started from a random vector, so values varied between runs at rounding level and the vectors' phase was arbitrary.
  - A fixed-seed start vector on the CPU backend makes two runs bit-identical; values match the previous ones to 6e-15.
  - CuPy's `svds` takes no start vector, so the GPU path is unchanged.
- **Memory:** the per-bin path weights one bin at a time. Weighting everything up front, which an intermediate version of this PR did, cost a full weighted copy: 54 MB against 1.7 MB peak for 52 MB of coefficients.

## Merged with master

`master` changed several kernels this branch moves (#88, #86, #84). A textual merge would have kept stale copies in the new modules. So the extraction was redone on `master`'s code: all 69 top-level definitions were byte-identical to `master`'s after the merge, and the review changes above were made on top of that.

## Verification

- **Numerics:** every default measure plus partial and canonical coherence, on 4 inputs (64 outputs), is bit-identical to `master`. Conditional and blockwise Granger (2, 3 and 5 signals, and a duplicated channel) are bit-identical too.
  - Global coherence's batched path is bit-identical.
  - Its per-bin path matches within the run-to-run variation it had on `master`. It is now itself reproducible.
- **Tests:**
  - Tests that patched kernels through `connectivity` now patch them where they're called.
  - Unit tests of the moved helpers live in `test_granger.py`, `test_multivariate.py` and `test_array_utils.py`.
  - The emulation guard test requires the new modules.
- **New tests:**
  - one patch point reaches every factorization and transfer-function call;
  - warning attribution through `Connectivity`, `from_multitaper`, `multitaper_connectivity` and a direct `minimum_phase_decomposition` call, including the conditional kernel's own positivity warning. These fail on the previous code.
  - weighted per-bin global coherence matches the batched path;
  - per-bin global coherence is reproducible.
- **Full suite:** 1534 passed, 15 skipped. ruff, mypy, codespell and doctests are clean, and the `-p no:warnings` run passes. Local patch coverage is above 99%.

## Compatibility

- **Private names:** code that imported moved private helpers from `spectral_connectivity.connectivity` must import them from `_granger`, `_multivariate` or `_array_utils`. `TIKHONOV_REGULARIZATION_FACTOR` and `GLOBAL_COHERENCE_BATCH_CHUNK_ELEMENTS` still resolve from `connectivity`, while `GLOBAL_COHERENCE_MAX_DENSE_COMPONENTS` now lives in `_multivariate`.
- **Warnings:** each warning now reports the caller's line instead of a package line.
- **Global coherence:** results on the CPU per-bin path are now deterministic.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f1e2b1ca137`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.