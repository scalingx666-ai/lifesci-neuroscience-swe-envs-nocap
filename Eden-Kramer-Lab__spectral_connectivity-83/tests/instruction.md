# Issue

**Title:** Speed up the Wilson minimum-phase factorization ~2-2.5x

## Description

## Summary

Second of the post-#79 cleanup PRs. It addresses the Wilson-speed item of #6; #82 covers the optional-caching item, so merging this completes the issue. The Wilson factorization dominates every directed measure (spectral Granger, DTF, PDC families).

.

1. **One solve per iteration, from a square root of S computed once.** The update `G⁻¹ S G⁻ᴴ + I` used to call `linalg.solve` twice. S never changes during the iteration, so it is now factored once per call as `S = L Lᴴ`. Each iteration does one solve, `X = G⁻¹ L`, and the update is `X Xᴴ + I`.
   - That costs the same as an explicit inverse, and the update is Hermitian positive semidefinite by construction.
   - An earlier revision of this PR inverted G explicitly. Review showed the rounding asymmetry in that update (and, less often, in master's two solves) stalls near-collinear channels just above the 1e-8 tolerance, so they came back NaN. See *Behavior change* below.
   - L comes from an eigendecomposition, which exists for singular S (duplicated channels) where Cholesky fails. Singular windows are still isolated as NaN through the existing `_solve_isolating_singular`. An indefinite or non-finite S returns NaN with the usual non-convergence warning.
2. **Half-spectrum iteration for real-valued signals.** When the input spectrum is exactly conjugate-symmetric (`S(-f) == conj(S(f))` bit for bit, as SciPy's FFT gives for real signals), every Wilson iterate keeps that symmetry.
   - The iteration then runs on the `n_fft // 2 + 1` non-negative frequencies with `irfft`/`rfft` and mirrors the factor once, at a single exit.
   - NaN mirrored at the conjugate frequency counts as symmetric, so a dead window does not force the whole batch onto the slow path.
   - Complex signals, and spectra symmetric only up to rounding, keep the two-sided path.
3. **Removed a per-iteration `.copy()`** that nothing needed. The previous iterate is aliased, and the factor is never updated in place.

## Behavior change

Near-collinear channels (condition numbers around 1e10 and above) now converge where they used to return NaN. The table counts NaN windows out of 200, with channel 2 = channel 0 + eps × noise:

| eps | master | explicit inverse (earlier revision) | this PR |
|---|---|---|---|
| 5e-5 | 9 | 32 | 0 |
| 4e-5 | 133 | 188 | 0 |
| 3e-5 | 200 | 200 | 0 |

The newly converged windows reconstruct S as well as well-conditioned ones do: median `G Gᴴ` vs `S` error of 5.5e-2, the resolution limit at n_fft=64. Directed measures for such channels are therefore finite where 2.x gave NaN. The CHANGELOG records this under *Changed*.

Rank-deficient spectra (more signals than trials × tapers) give the same NaN patterns as master.

## Measurements (CPU)

Master and this branch were run alternately in separate processes; each figure is the minimum of three runs. Absolute times varied by up to 25% between two sessions on the same machine, so the second run's ratios are shown alongside.

| Case | master | this PR | speedup (2nd run) |
|---|---|---|---|
| Factorization: 24 signals, 1001 bins | 0.62 s | 0.32 s | 1.95× (1.8×) |
| Factorization: 40 batched 2×2 pairs | 0.28 s | 0.10 s | 2.8× (2.9×) |
| Factorization: 100 windows × 8 signals × 201 bins | 1.52 s | 0.60 s | 2.5× (2.5×) |
| `directed_transfer_function`, 100 windows × 8 signals | 0.61 s | 0.33 s | 1.9× (1.8×) |
| `pairwise_spectral_granger_prediction`, 32 signals | 3.80 s | 1.58 s | 2.4× (2.2×) |
| `conditional_spectral_granger_prediction`, 24 signals | 12.6 s | 7.6 s | 1.65× (1.9×) |

Results match master to at most 5e-15 relative (conditional Granger 2.6e-14), with identical NaN patterns in every case.

The eigendecomposition of S costs about 6% of a factorization. Trying Cholesky first would recover about 5%, but it needs a second path plus a per-window fallback on CuPy, so I left it out.

## GPU

- `rfft`/`irfft` come from `cupyx.scipy.fft`.
- If CuPy's FFT of real input is not *exactly* conjugate-symmetric, the GPU takes the two-sided path. That is still correct, and it keeps the single-solve speedup.
- The emulated-device test runs pairwise Granger through the half-spectrum path and checks that it stays on the device.
- **Not verified on real CuPy:** the half-spectrum path, or batched `cupy.linalg.eigh` for the square root.

## Compatibility

- Public signatures are unchanged.
- The private `_get_linear_predictor` now takes the square root of S instead of S itself.
- The private helper `_hermitian_square_root` is new. `_solve_isolating_singular` is kept, and the earlier revision's `_inverse_isolating_singular` is gone.

## Test plan

- [x] **Near-collinear regression:** channels at eps=3e-5 converge without a warning and reconstruct S as well as clean channels do. The test fails with the explicit-inverse or two-solve update.
- [x] **Half-spectrum return paths:** the non-convergence, singular-window and `_warn_on_failure=False` behaviour is tested on both the half-spectrum and two-sided paths. Each checks the two-sided output shape, and that healthy windows match their own factorization.
- [x] **Symmetry checks:** each of `_is_conjugate_symmetric`'s checks is broken in its own test (complex zero frequency, unconjugated imaginary parts, a one-ulp change). Mirrored and unpaired NaN are also covered.
- [x] **Helpers:** `_to_two_sided` and the half-spectrum `_get_causal_signal` are tested directly for even and odd lengths.
- [x] **Half vs full:** the two iterations agree to 1e-13 relative with an extra batch axis, and the factor is exactly conjugate-symmetric.
- [x] **Oracles:** the analytic VAR oracles (Geweke pairwise Granger, state-space conditional Granger, DTF/PDC closed forms) run on both paths.
- [x] **Mutation check:** 12 targeted source mutations (skipped mirror, dropped symmetry checks, no eigenvalue clip, old update formula, and others) were each caught by a test.
- [x] **Full suite:** passes with all 25 snapshots unchanged. ruff, mypy and doctests are clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b9b841f42d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.