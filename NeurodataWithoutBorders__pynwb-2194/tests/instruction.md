# Issue

**Title:** Add num_samples to ImageSeries

## Description

## Summary

- Points the nwb-schema submodule to the latest dev tip (`489cc31f`), which adds the optional
  `num_samples` dataset to `ImageSeries`. Corresponds to 
- Implements `num_samples` in `ImageSeries`: when `format='external'` and `rate`-based timing is
  used, the data array is empty (shape `(0, 0, 0)`) and its length cannot be used to determine the
  frame count. `num_samples` fills that gap.
- Raises `ValueError` on construction when `external_file` + `rate` are set but `num_samples` is
  absent. Files missing the field are read silently (no warning) to avoid noise from existing data.
- Overrides `TimeSeries.num_samples` (a computed read-only property) with a stored attribute backed
  by `self._num_samples`, falling back to the parent implementation for data-bearing series.
- Updates gallery docs to document the `rate` + `num_samples` requirement for external-file series.
- Pins HDMF to `>=6.0.2`, which fixed a `TypeError` when writing `np.uint64` values.

## Checklist

- [x] `num_samples` is written to and read back from HDF5 (roundtrip test added)
- [x] `ValueError` raised when `external_file` + `rate` + no `num_samples` on construction
- [x] No error or warning when reading old files without `num_samples`
- [x] `num_samples` not required when `timestamps` is provided
- [x] Gallery docs updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87ad6e281e00`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.