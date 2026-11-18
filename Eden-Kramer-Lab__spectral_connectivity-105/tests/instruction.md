# Issue

**Title:** GPU performance: batch the Granger pairs, avoid CuPy's slow SVD path, fix eigh crash

## Description

Stacked on #104 (GPU-aware test suite). Merge that first; this PR's base will then retarget to `master`.

## Summary
A CuPy audit on an A100 found two measures that were slow on the GPU (one of them 13x *slower* than on the CPU), one GPU crash, and per-iteration device syncs. These commits fix them while keeping CPU results bit-identical, except where noted below.

| commit | change |
|---|---|
| `536aaa3` | **GPU:** real input goes through `rfft` with an exact conjugate mirror. cuFFT's complex FFT of real data was conjugate-symmetric only to ~1e-16, so Wilson's half-spectrum fast path never ran on the GPU. It now runs in every case (0 of 120 → 120 of 120 pairwise-Granger calls). The CPU keeps SciPy's FFT, because rfft+mirror was slower there. |
| `64e7b2c` | **Crash fix:** CuPy's batched `eigh` (cusolver syevjBatched) raises `CUSOLVER_STATUS_INVALID_VALUE` at ~2²¹ matrices. `_hermitian_square_root` now splits the batch into chunks (`_batched_eigh`). cholesky, solve and svd have no such limit (measured). Wilson also syncs once per iteration instead of twice: `tril_indices` is hoisted out of the loop. |
| `c441efa` | **canonical_coherence and thin global_coherence** use `eigh` of the smaller Gram matrix instead of `svd`. CuPy loops one bin at a time in `svd` once either dimension exceeds 32. A two-pass polar factor restores SVD accuracy up to κ≈1e7. |
| `2f1bc73` | **GPU:** pairwise, time-reversed and blockwise Granger factor many pairs per Wilson call, in chunks of at most 2²² elements. Subset Granger's scatter and a boolean-mask assignment no longer sync. The CPU keeps one pair per call, because batching measured slower there. |
| `5be310c` | Review fix: each channel is normalized to unit norm before the rank threshold, so a small but independent channel (mixed units) isn't dropped. |

## Timings (old = `296b77c`, new = this branch)
One idle A100, old and new runs alternated, best of 2 rounds × 3 repeats. Coefficients (30 windows, 10 trials, 5 tapers, 1000 FFT bins, 16 signals); the 64-signal row uses 100 windows × 1 trial × 5 tapers × 500 bins.

| GPU | old | new | speedup |
|---|---|---|---|
| `canonical_coherence` (4 groups × 4) | 21.8 s | 0.27 s | **82×** |
| `global_coherence` (64 signals) | 21.8 s | 0.13 s | **168×** |
| `pairwise_spectral_granger_prediction` | 3.8 s | 0.83 s | **4.6×** |
| `directed_transfer_function` | 0.16 s | 0.09 s | **1.9×** |
| `subset_pairwise_spectral_granger_prediction` (all 120 pairs) | **CUSOLVERError** | 0.92 s | crash fixed |
| fft, coherence, wPLI, global coherence (16 signals) | — | — | unchanged |

`bench_default_measures.py` case (b) pairwise Granger on the GPU: 12.8 s → 0.36 s.

**CPU:** no regressions. The host is shared (load average ~50 on 96 cores), so I re-ran the A/B with BLAS limited to 8 threads, 3 alternating rounds:
- `directed_transfer_function`: 11.5 s old vs 11.3 s new.
- `pairwise_spectral_granger_prediction`: 19.8 s old vs 19.3 s new.
- `global_coherence` (16 signals) looked 25% slower once. In isolation it measures 2.24 s old vs 2.19 s new; its code path is unchanged apart from comments.

## Behavior changes (in CHANGELOG)
- **`canonical_coherence` with a dead, duplicated or collinear channel** used to be inflated (by up to 0.12 in tests). The SVD turned each zero singular direction into an arbitrary unit-norm direction that depended on the LAPACK build. Such directions are now dropped, so the value equals that of the group's independent channels. *(Fixed)*
- **GPU `coherence_phase` at the Nyquist bin** is now 0 or +π, as on the CPU, instead of a rounding-dependent −π.
- **`canonical_coherence` of a group with no power** at a bin is NaN there (with a warning); a group with dependent channels warns.
- **Warnings:** conditional Granger's degenerate-bins warning fires once per call instead of once per pair. On the GPU, the Wilson non-convergence warning counts sub-spectra per chunk.

## Verification
- **Full suite:** CPU 1774 passed, 15 skipped; GPU (A100) 1758 passed, 31 skipped, 0 failed. Doctests pass on both. ruff and mypy are clean.
- **`bench_default_measures.py --compare` against the `296b77c` baseline:**
  - CPU: PASS, every difference 0.
  - GPU: every output within 4.4e-13, except the Nyquist `coherence_phase` flip above. All 137 changed entries are at bin 250 of 500, and new-GPU vs CPU there is 8.5e-14 (old GPU was 2π off).
- **Every wrapper measure (46 outputs) vs baseline:**
  - CPU: bit-identical except `canonical_coherence` (1.3e-15 relative).
  - GPU: ≤ 4.3e-14 relative, with no NaN-pattern changes.
- **Independent review of the combined diff:** it found the channel-scale issue, now fixed in `5be310c` with a test that failed before the fix by up to 0.20. The other paths it checked were correct: rfft edge cases, chunk remainders, Granger gather/scatter, and subset duplicate-pair handling.

## Known limits, not changed here
- CuPy batched `eigh`/`svd` slow down sharply above 32×32 (eigh: 4 µs at n=32, 107 µs at n=33). Global coherence with more than 32 signals in a decomposition is still only a few times faster than the CPU. This is documented in the audit, not the code.

## Default frequency grid now matches across backends (#106, squashed here as `1d5ab24`)
SciPy's `next_fast_len` treats 11 as a fast factor and CuPy's doesn't, so the default FFT length (and frequency grid) differed by backend for many lengths (e.g. 3601 samples gave 1816 bins on CPU vs 1823 on GPU). The default now follows SciPy on both backends. CPU results are unchanged, and cuFFT is no slower at SciPy's lengths:
- Raw FFT: median time ratio 1.00 over 25 sampled lengths.
- End to end at the slowest raw case (3601 samples): fft plus the default measures took 309 ms vs 366 ms.

Morlet's internal padding never reaches the output grid, so it keeps CuPy's rule (measured 1.06× slower with SciPy's).

## Review fixes (`c6b1a49`)
A four-agent review (code, tests, comments, silent failures) found the following. Each critical item was reproduced before fixing and now has a regression test that fails without the fix.
- **complex64 canonical coherence:** near-collinear groups gave 0.0035 instead of 0.917, because the Gram matrix squares the condition number. The whitening now runs at complex128.
- **GPU crash in canonical coherence:** the unchunked `eigh` raised `CUSOLVERError` at 2.2M Gram matrices per group (4000 windows × 551 bins), reproduced on the A100 through the public API. It now uses the shared chunked `_batched_eigh` (moved to `_array_utils`), runs in 4.1 s, and matches CPU to 4e-15.
- **Group with no power:** it returned a silent 0.0 and is now NaN with a warning, matching coherency. Groups with dependent channels also warn that only their independent signals contribute.
- **New tests** for paths no test guarded:
  - subset Granger concatenated across chunks
  - blockwise batching with mixed group sizes
  - a pair that fails even when factored alone
  - a single early degenerate conditional pair
  - rfft DC/Nyquist zeroing
  - thin global-coherence vector directions
- **CHANGELOG and docstring corrections:**
  - Removed a wrong claim about Wilson warning counts.
  - Thresholds and batch limits now say how they depend on the number of signals.
  - The Nyquist phase is "0 or +π".

After the fixes: CPU 1783 passed; GPU 1767 passed, 0 failed; doctests pass on both; parity against `296b77c` is unchanged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PBZdURGgoGW24tYeJw67vh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1861613609f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.