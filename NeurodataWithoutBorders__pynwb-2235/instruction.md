# Issue

**Title:** Accept zarr arrays in array-valued fields and when determining data lengths

## Description

## Motivation

.

A zarr v3 `Array` provides `shape` and `__getitem__` but neither `__iter__` nor `__len__`. Reading an NWB file through the zarr backend passes such arrays straight into container constructors, where pynwb rejected or crashed on them in two ways: docval fields declared `type=collections.abc.Iterable` failed the `isinstance` check, and code that called `len()` on possibly-lazy data raised `TypeError: object of type 'Array' has no len()`.

hdmf already registers `zarr.Array` in its `array_data` docval macro, so both problems are pynwb-side.

## Changes

Retyped array-valued fields from `Iterable` to `('array_data', 'data')`: `TimeSeries.control` and `control_description`, `ImageSeries.dimension` and `starting_frame`, `TwoPhotonSeries.field_of_view`, `AbstractFeatureSeries.features` and `feature_units`, and the deprecated `Clustering.peak_over_rms`, `ClusterWaveforms.waveform_mean`, and `ClusterWaveforms.waveform_sd`. `NWBFile.electrode_groups` keeps `Iterable`: it holds `ElectrodeGroup` objects, not array data.

Replaced the `len()` calls on array-like data with `get_data_shape`, in `ElectricalSeries.__init__` (the electrode count behind the data-orientation check) and in `TimeSeries.num_samples` and `TimeSeries.get_timestamps`.

## Behavior changes

`('array_data', 'data')` accepts `zarr.Array` but rejects non-array iterables (`str`, `set`, `range`, generators) that `Iterable` allowed. For these fields that is a desirable tightening.

`TimeSeries.get_timestamps` raises a `ValueError` when timestamps must be generated but the number of samples cannot be determined, in place of a `TypeError` from `len()`.

`TimeSeries.num_samples` reports the length of a `DataChunkIterator` that wraps an array, where it previously returned `None`, and its warnings for indeterminate lengths are reworded.

## How tested

Full unit and integration suite passes. `tests/unit/test_zarr_arrays.py` covers the length-determining paths against real zarr arrays; it skips unless zarr v3 is importable, since zarr is not a pynwb dependency and hdmf-zarr does not yet support zarr v3. Verified locally against zarr 3.2.1.

## Checklist

- [x] Did you update `CHANGELOG.md` with your changes?
- [x] Did you add/update tests?

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac143eef44ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.