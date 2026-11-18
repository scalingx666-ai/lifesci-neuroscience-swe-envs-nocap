# Issue

**Title:** BUG: preserve correlogram unit axes across segments

## Description

.

When a unit is silent in one segment, the NumPy path sizes its segment result from the number of active units. With two units this can broadcast counts into the wrong pairs; non-contiguous indices can also raise an error. Pass the complete sorting's unit count to both segment helpers so each result preserves the global unit axes, including empty segments.

The optional `num_units` argument also affects direct calls to the exported helpers. Without it, the size is inferred as `max(unit_index) + 1` (zero for empty input), leaving zero rows for missing indices. For example, labels `[0, 2]` now produce three auto-correlogram rows rather than two. This preserves index coordinates instead of dropping counts or raising for non-contiguous indices. I am open to using an accumulator argument instead if that is the preferred API.

The regression checks exact auto- and cross-correlogram counts for two and three units across segments, including an empty segment. It runs without Numba and additionally compares both implementations when Numba is installed. Both cases fail against the corresponding functions from upstream `f03253e9c` and pass with this change.

Validation on Python 3.13:
- Full `test_correlograms.py` module: **42 passed, 40 skipped**.
- Black check on both changed files: passed.
- `git diff --check`: passed.

The test environment uses the development ProbeInterface dependency required by this checkout and its declared Zarr 2 / numcodecs constraints. Pytest plugin autoload was disabled to avoid loading an unrelated DANDI plugin from the host environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a27a2561956`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.