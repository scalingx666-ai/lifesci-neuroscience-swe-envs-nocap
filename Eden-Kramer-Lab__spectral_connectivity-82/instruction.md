# Issue

**Title:** Cache control and lower Morlet peak memory

## Description

## Summary

First of the post-#79 cleanup PRs. Part of #6: this covers its optional-caching item; #83 covers the Wilson-speed item. It adds a public way to release cached intermediates and removes two memory costs that measurements showed were unnecessary.

- **`Connectivity.clear_cache()`** frees the cached intermediates: the cross-spectral matrix, power, phase-lag moments, and the minimum-phase factorization with the Granger quantities derived from it. Later measures recompute the same results. This is the former private `_clear_cached_intermediates`, now public. It is registered in `_NON_MEASURE_METHODS`, so the wrapper and jackknife reject `method="clear_cache"`. I chose a method over a `cache=False` flag because caches are already per-instance and cleared automatically when `fourier_coefficients`, `expectation_type` or `observation_weights` change; a flag would double the code paths.
- **Coherence and phase-lag-index measures no longer cache the pairwise power normalizer `sqrt(P_i P_j)`.** It is rebuilt on each call as the outer product of `sqrt(P)`: n square roots rather than n², and it can't underflow or overflow the way `P_i * P_j` can.
- **`MorletWavelet.fft` fills a preallocated array** instead of stacking per-frequency results, and scales only the samples it keeps after decimation.

## Measurements (CPU, tracemalloc for memory)

| Change | master | this PR |
|---|---|---|
| Morlet `fft`, 60 s at 1 kHz, 8 signals, 40 frequencies: peak | 907 MiB (3.10× output) | 607 MiB (2.07×) |
| Morlet `fft` runtime | 0.38 s | 0.37 s |
| Coherence, phase and imaginary coherence, 128 signals × 512 bins: retained cache | 193 MiB | 129 MiB |
| The same three measures on a fresh instance (cold) | 0.27 s | 0.27 s |
| The same three measures repeated on a warm instance | 198 ms | 229 ms |

**Tradeoff:** repeating a coherence or phase-lag measure on an instance whose caches are already filled is 15–25% slower (16, 64 and 128 signals), because the normalizer is rebuilt on each call. A single pass, which is what `multitaper_connectivity` does, is unchanged. Retained memory drops by a third at every size.

**Numerics:** Morlet output is bit-identical to master. Coherence-family outputs differ from master by at most 5.6e-16 (absolute) because of the `sqrt(P)` outer product; NaN patterns are identical. All other measures are bit-identical.

**Not changed, based on measurement:**
- Jackknife: the replicate list holds about 20 MiB of a 266 MiB peak; the per-replicate `Connectivity` copies dominate. Preallocating the list isn't worth it.
- Morlet windowing copy: `_sliding_window(..., is_copy=False)` would bring the Morlet peak to 1.15× the output. But `fft()` would then return read-only, possibly overlapping views, which changes the public return value. That needs its own decision.

## Compatibility

Nothing breaks. `clear_cache` is a new method and the other changes are internal. Coherence-family values change only at floating-point rounding level.

## Test plan

- [x] `test_morlet_fft_peak_memory_stays_near_twice_output_size`: fails on master (3.1×), passes here (< 2.5×). It measures from a baseline, so it also passes when tracemalloc is already on (`PYTHONTRACEMALLOC=1`).
- [x] `test_morlet_padding_modes_match_padded_convolution` now checks three frequencies with different wavelet widths against a `fftconvolve` reference; it fails if two frequency slots are swapped.
- [x] `test_coherence_measures_retain_only_power_and_cross_spectrum`: fails on master (the normalizer was retained).
- [x] `test_clear_cache_frees_intermediates_and_preserves_results`: coherence, wPLI and DTF, which covers the minimum-phase caches; it fails if `clear_cache` does nothing.
- [x] The registry and wrapper-rejection tests take the non-measure names from `_NON_MEASURE_METHODS`, so each registered non-measure is checked automatically.
- [x] Full suite: 1399 passed, 15 skipped. ruff format/check, mypy and the doctests are clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e240e532135`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.