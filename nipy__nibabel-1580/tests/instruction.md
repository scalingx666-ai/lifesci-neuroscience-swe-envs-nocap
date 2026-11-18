# Issue

**Title:** BF: match SeriesAxis slicing to NumPy

## Description

`SeriesAxis(0, 2, 5)[::2].time` currently returns `[0, 4]`, while slicing its NumPy time array returns `[0, 4, 8]`. Bounds outside the axis can also invent points: `[-100:]` returns 100 points instead of 5, and `[5::-1]` starts beyond the last point.

This uses `slice.indices()` to normalize bounds and `len(range(...))` to count selected points without allocating a time array. The regressions compare against NumPy across empty, singleton, even- and odd-length axes, in both directions. A zero step now raises the usual `ValueError`.

![Measured slice lengths before and after the fix, with NumPy as reference](https://raw.githubusercontent.com/Don-Yin/nibabel/dee34dc7d0180f6b470578390ee7caa30df90d7f/seriesaxis-slicing.png)

Validation (Python 3.14, NumPy 2.4.3):

- New regressions: 16 failed / 17 passed on the base; 33 passed with the fix.
- `python -m pytest nibabel/cifti2 --doctest-modules --doctest-plus -ra`: 150 passed, 16 skipped (optional CIFTI data absent), 1 expected failure.
- `ruff check nibabel/cifti2/cifti2_axes.py nibabel/cifti2/tests/test_axes.py`
- `ruff format --check nibabel/cifti2/cifti2_axes.py nibabel/cifti2/tests/test_axes.py`
- `codespell nibabel/cifti2/cifti2_axes.py nibabel/cifti2/tests/test_axes.py`

Ruff 0.17.1 and codespell 2.4.3 both pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e27a909743a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.