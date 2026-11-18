# Issue

**Title:** Use SciPy's FFT length for the default frequency grid on the GPU too

## Description

Stacked on #105. Merge #104 and #105 first; this PR's base will then retarget to `master`.

## Summary
The default `n_fft_samples` came from each backend's `next_fast_len`. SciPy treats 11 as a fast factor and CuPy doesn't, so **the same data could get a different frequency grid on CPU and GPU**. The two rules differ for 8258 of the lengths from 64 to 19999; for example, 3601 samples pad to 3630 on CPU (1816 bins) but 3645 on GPU (1823 bins).

The default now follows SciPy's rule on both backends (`_backend.default_fft_length`). CPU results are unchanged; GPU users of the default get the CPU's grid. The Morlet transform's internal padding never reaches the output grid, so it keeps the backend's own `next_fast_len`.

## Does this slow the GPU?
No:
- **Raw cuFFT** at SciPy's vs CuPy's length, 25 sampled differing lengths: median time ratio 1.00 (range 0.56–1.71).
- **End to end** at the slowest raw case (3601 samples; 20 windows × 10 trials × 16 signals, A100): `Multitaper.fft` 14.5 vs 17.4 ms, and fft plus the default measures 309 vs 366 ms (0.84×). The FFT is a small share of the run, and SciPy's shorter length means fewer bins downstream.

## Changes
- `_backend.py`: `default_fft_length` is `scipy.fft.next_fast_len` on both backends, with a comment explaining why.
- `transforms.py`: `Multitaper`'s default length uses it; the docstring is updated.
- Tests:
  - A new test checks the default grid at 3601 samples on both backends. It fails on the GPU without this change.
  - The notebook fixture's `n_fft_samples` pin, a workaround from #104, is removed.
- CHANGELOG: an entry under *Changed*.

## Verification
- CPU: 1784 passed. GPU (A100): 1768 passed, 0 failed.
- Doctests and all 25 snapshots pass on both backends.
- `bench_default_measures.py --compare` on CPU: PASS.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PBZdURGgoGW24tYeJw67vh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6b1a491cad0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.