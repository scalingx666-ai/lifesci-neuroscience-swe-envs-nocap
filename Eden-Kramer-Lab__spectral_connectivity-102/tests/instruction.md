# Issue

**Title:** Coordinate labels, transform self-description, and taper validation (3.0 consistency PR 1)

## Description

First of six 3.0 consistency PRs. Tracking issue for the 4.0 alias removals: #101.

- **Morlet coordinate labels (D18).** The validity mask was attached as a DataArray carrying its own unlabeled `time`/`frequency` coordinates, which replaced the result's; Morlet results lost `long_name`/`units`. The mask's values are now attached alone. Test covers pairwise, power, and delay outputs and a NetCDF round trip.
- **Coordinate descriptions (D20).** `band`, `band_lower`, `band_upper`, and the per-connection group labels get a `long_name` (edges keep the frequency units). Channel coordinates copied from an input DataArray (e.g. `region`) now keep the input's attrs; the package does not invent a `long_name` the input did not give.
- **STFT describes itself (D26).** `ShortTimeFourierTransform` inherited Multitaper's `repr`/`summarize_parameters` and printed `Multitaper(...)` with NW=1 and one DPSS taper. It now reports the Hann window, window/step, and equivalent noise bandwidth; the summary layout is shared and Multitaper's output is unchanged (doctest).
- **Welch settings (D27).** Detrending, start time, FFT length, workers, and segment duration were only on an internal STFT, and the sampling rate/overlap/sample counts were writable attributes that could drift from the computation. All are now read-only properties read from the STFT that computes; the segment/step rounding to whole samples is documented.
- **Taper counts (D30).** `Multitaper` rejects zero, negative, above-window, boolean, or tapers-disagreeing `n_tapers` at construction. v2.0.1 accepted them and failed inside `fft()` with SciPy's `select_range` error (or used `True` as one taper); CHANGELOG Fixed entry.

Each change has a test that failed before it. Full suite, doctests, ruff, and mypy pass locally.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6c76f978d37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.