# Issue

**Title:** Fix GPU import warning under CuPy 14 and device coordinates in fourier_connectivity

## Description

## Summary
This is the first part of re-validating the GPU backend on real hardware (A100 80GB, CuPy 14.2.0 / CUDA 12.9 runtime, driver 580 / CUDA 13.0).

- **`_backend.py`**: CuPy 14's `cupyx.scipy.signal` emits `FutureWarning: cupyx.jit.rawkernel is experimental` on import. Users can't act on it, and under the project's `filterwarnings = error` it broke test collection, so the GPU release gate (`pytest -m gpu`) could not run at all. It is now suppressed around the `detrend` import only.
- **`wrapper.py`**: on GPU, `Multitaper.frequencies` and `.time` are CuPy arrays, so `fourier_connectivity(m.fft(), frequencies=m.frequencies, time=m.time)` raised `Implicit conversion to a NumPy array`. Both coordinates are now moved to the host with `to_numpy`, as `Connectivity` already does. A new emulated-device test (`test_fourier_connectivity_accepts_device_frequencies_and_time`) covers this on CPU CI; it fails without the fix.

## Verification
- `SPECTRAL_CONNECTIVITY_ENABLE_GPU=true uv run --extra gpu pytest -m gpu` passes on an A100.
- Every measure in `list_measures()` was run through `multitaper_connectivity` on GPU and CPU (46 outputs). All agree to ≤ 1e-9 relative, with the same NaN positions and the same warnings. Two exceptions differ only by an arbitrary sign/phase, which no convention promises: the global-coherence vectors (|⟨cpu, gpu⟩| = 1 in every bin) and the MIC component filters/patterns.
- CPU suite: 1735 passed, 15 skipped; `ruff format --check`, `ruff check`, `mypy src/` and the doctests are clean.

Follow-ups in separate PRs: a GPU-aware test suite and a CuPy best-practices/performance pass.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PBZdURGgoGW24tYeJw67vh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0682eae83841`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.