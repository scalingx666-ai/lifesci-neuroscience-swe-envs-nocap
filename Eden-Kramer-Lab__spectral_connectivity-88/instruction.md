# Issue

**Title:** Speed up the default measure set ~2x

## Description

## Summary

This PR speeds up the default `multitaper_connectivity` measures by about 2.2–2.7x on the trial-based workloads below (1.5x with sliding windows). It was stacked on #83; now that #83 is merged, it is based on `master`.

Profiling showed two costs dominating the default measures: pairwise spectral Granger (the Wilson factorization) and the per-observation moments of the phase-lag-index family. This PR addresses both, plus a few places that computed values only to discard them.

1. **Closed-form 2×2 solve in the Wilson update.**
   - Each Wilson iteration solves `X = G⁻¹ L`, where `L` is the square root of S from #83. Every 2-signal factorization solves 2×2 systems: pairwise and subset Granger, and DTF/PDC/conditional Granger on 2 signals. For these, LAPACK's per-matrix overhead dominates, so Cramer's rule is used instead. Larger systems keep LAPACK.
   - A matrix counts as singular only when its determinant is exactly zero or non-finite. Such matrices give NaN without NumPy warnings, and whether a matrix is flagged does not depend on the rest of the batch.
2. **Phase-lag moments** (PLI, wPLI, their debiased forms, dPLI):
   - only the non-negative frequencies are reduced, since those are all these measures return;
   - `Im(X_i X_j*)` is formed by real broadcasting from contiguous copies of the real and imaginary parts, instead of a complex batched matmul with an inner dimension of 1;
   - when the workspace splits the signals into several tiles, each tile skips its pairs with earlier signals, and those are filled by symmetry. A single tile still computes every pair. The mirror is exact, because `(j, i)` is the IEEE negation of `(i, j)`.
3. **Coherency, imaginary coherence, PLV/PPC** normalize only the frequencies they return.
   - `_nonnegative_pairwise_power_scale` replaces #82's full-spectrum `_pairwise_power_scale` and keeps its overflow-safe `sqrt(P_i)·sqrt(P_j)` form, on the kept bins only.
   - The trimming now goes through shared accessors (`_nonnegative_fourier_coefficients`, `_nonnegative_cross_spectral_matrix`), which partial coherence and the group measures also use now.
4. **Transfer function and noise covariance** read the Wilson factor's lag-0 coefficient as a mean over frequencies instead of a full inverse FFT. They also form the transfer function only at the bins their callers keep.

### Fixes to regressions found in review
Each came with a test that failed before the fix.
- With `observation_weights`, the phase-lag measures raised a broadcasting `ValueError` on a two-sided spectrum, because the weights were not trimmed to the reduced frequencies. `_expectation` now takes the weights for the leading bins it is given, as `_reduced_cross_spectral_matrix` already did.
- An error partway through the moment reduction left uninitialized arrays in the moment cache, and a later measure returned them. Moments are now cached only once they are complete. This bug predates this PR, but it is unreleased.
- The 2×2 solve emitted `invalid value` RuntimeWarnings on NaN or Inf systems, where LAPACK had been silent. Example: pairwise Granger with a duplicated channel. Under `-W error` these became exceptions.

## Measurements

End-to-end `multitaper_connectivity` with the default measures, on simulated VAR(2) data at 1 kHz. Master and this branch each ran in their own process with the same script. Times are the best of 3 runs; the sliding-window case ran once.

| Workload | master | this PR | speedup |
|---|---|---|---|
| 32 ch × 50 trials × 1 s | 4.81 s | 2.21 s | 2.2× |
| 64 ch × 100 trials × 1 s | 33.4 s | 12.4 s | 2.7× |
| 16 ch, 60 s, 117 sliding 2 s windows | 115 s | 78 s | 1.5× |

Step-level measurements:
- 2×2 Wilson solve, 117 windows × 1001 bins: 16.8 → 7.2 ms against LAPACK.
- Detecting non-finite systems from the determinant, instead of a separate pass over every matrix, makes the solve a further ~15% faster (2.07 → 1.72 ms at 117 × 251).
- Contiguous real and imaginary parts make all four phase-lag moments about 22% faster at 32 ch × 50 trials (0.87 → 0.68 s). `Multitaper` leaves the signal axis slowest in memory.
- Transfer function + noise covariance for a 117 × 2000 × 16 factor: 0.42 → 0.10 s.

The sliding-window case is still dominated by pairwise Granger: 120 pairs, each factoring 117 × 1001 half-spectrum 2×2 matrices for about 25 iterations.

## Numerical equivalence

Every default measure plus partial and canonical coherence was compared against `master`. The inputs were Multitaper data with 2 and 5 signals, and random two-sided coefficients with and without non-uniform weights. Across these and an earlier 123-case sweep (even/odd n_fft, all expectation types, complex64, singular and NaN inputs), shapes, dtypes and NaN patterns are identical.

| Measures | Max relative difference vs master |
|---|---|
| coherency, coherence magnitude, imaginary coherence, PLV, PPC, PLI, dPLI, debiased PLI, partial and canonical coherence | bit-identical |
| DTF, PDC | ≤ 2e-13 |
| debiased wPLI, wPLI | ≤ 1e-12, where the mean nearly cancels (≤ 5e-16 of each pair's `E\|Im\|`) |
| pairwise Granger | ≤ 6e-13 |
| conditional Granger | ≤ 6e-12 |

For the 2×2 solve alone, 75 two-signal cases were checked: real, complex, duplicated-channel, non-converging, and with `_warn_on_failure=False`.
- Factors agree with master to 2.3e-15 relative.
- Near-collinear channels (eps = 1e-3) differ by up to 2.7e-10, within the 1e-8 convergence tolerance.
- Near-collinear convergence is unchanged: 0 of 200 windows are NaN for eps from 1e-4 down to 1e-6.

## Tests

- `test_solve_isolating_singular_matches_lapack` covers 2×2 (closed form) and 3×3 (LAPACK), including singular and ill-conditioned matrices. `test_solve_2x2_marks_exactly_singular_and_non_finite_systems_nan` pins the singular rule: zero determinant, NaN and Inf give NaN with no warnings, and a near-singular system is solved.
- `test_nan_window_leaves_the_other_windows_unchanged` now also runs with 2 signals, where it fails on any RuntimeWarning. The LAPACK isolation test moved to 3×3 so it still exercises LAPACK.
- The weighted two-sided spectrum is tested for the phase-lag family (n_fft 8 and 9) and for PLV.
- The tiled phase-lag test now includes dPLI and tiles two rows wide, so the in-tile mirror is exercised.
- `test_failed_phase_lag_reduction_caches_nothing` checks the cache after an injected failure.
- `test_phase_lag_index_family_matches_per_fcn_reference` compares wPLI and debiased wPLI with `rtol=1e-12`; they were exact before. PLI stays exact.
- Mutation testing (29 mutants) found gaps in the PLV weights and the multi-tile mirror; both are now covered. The rest were caught, apart from three that cannot change any public output, e.g. rescaling the lag-0 coefficient, which cancels.
- The full suite passes, both normally and with `-p no:warnings` as in the min-deps job. ruff, mypy and doctests are clean.

## Conflicts with other open PRs

- **#84 and #85** move `_estimate_transfer_function` / `_estimate_noise_covariance` into `_granger.py` and the backend imports into `_backend.py`. Whichever lands later needs to carry these hunks over. `ifft` is no longer used by `connectivity`/`_granger`, and `_estimate_transfer_function`'s `n_frequencies` is now required.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3e24efb29e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.