# Issue

**Title:** Accept xarray.DataArray input in multitaper_connectivity

## Description

## Summary

Adds first-class `xarray.DataArray` support to `multitaper_connectivity`, allowing labeled inputs to provide axis roles, channel labels, a sampling rate from their time coordinate, and input metadata. It also strengthens NetCDF provenance serialization.

The implementation changes are confined to `spectral_connectivity/wrapper.py`, documentation, and tests. The numerical core in `transforms.py` and `connectivity.py` is unchanged.

## Compatibility

- Existing valid NumPy/CuPy calls keep the same positional API and numerical computation. `sampling_frequency` remains positional argument 2 and is still required at runtime for plain arrays.
- Wrapper metadata, signal-label validation, and some error propagation are stricter for all input types.
- DataArrays that were previously accepted incidentally by positional axis order may now be transposed according to dimension names or rejected when their roles are ambiguous. Callers with domain-specific names should pass `time_dim`, `trial_dim`, and `signal_dim` explicitly.

## What's new for DataArray input

- **Name-driven axes.** Time, trial, and signal roles are inferred from common dimension-name synonyms and transposed into the core's `(time[, trial], signal)` order. Ambiguous mappings raise; assigning the single remaining dimension by elimination emits a warning.
- **Channel-label propagation.** A one-dimensional signal index becomes the output `source` and `target` coordinates with its xarray dtype preserved, unless `signal_names=` overrides it.
- **Optional sampling frequency.** A regularly spaced numeric `time` coordinate in elapsed seconds can supply `sampling_frequency` and `start_time`. Explicit rates are validated against the coordinate. A numeric `sample` index can supply the start time when a rate is given, but cannot infer a rate by itself.
- **Input metadata.** DataArray `.attrs` are preserved as a canonical `input_attrs_json` provenance record.
- **Actionable validation.** Ambiguous dimensions, conflicting start times, non-uniform or precision-starved time coordinates, invalid labels, and lazy dask backing fail explicitly instead of being silently misinterpreted.

## Provenance

Results record transform, measure, package, backend, and input provenance through `mt_*`, `measure`, `measure_kwargs_json`, `arg_<key>` / `arg_<key>_json`, `input_attrs_json`, and related attributes.

Structured values, non-string mapping keys, and non-finite floats are normalized into canonical JSON suitable for NetCDF attributes. Objects outside the supported scalar, NumPy, mapping, and sequence types receive a best-effort type/`repr` record; that representation may not be reproducible when the object's `repr` contains process-specific details such as a memory address. Attribute-name collisions raise rather than silently overwriting provenance.

## Known limitations

- Time coordinates must be numeric elapsed seconds or sample numbers. `datetime64`, `timedelta64`, and object-valued time coordinates are not yet supported and raise with a conversion hint.
- Dask-backed DataArrays must be materialized with `.compute()` or `.load()` before use.

## Testing

The current CI matrix is green for:

- Python 3.10–3.13 on Linux, macOS, and Windows
- Minimum supported dependencies on Python 3.10
- Ruff formatting and linting, mypy, and wrapper doctests
- Wheel and source-distribution builds and installation tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f505bf05ec84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.