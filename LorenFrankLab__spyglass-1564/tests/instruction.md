# Issue

**Title:** Fix excess spike indices in CurationV1/SpikeSorting get_sorting by removing invalid spikes

## Description

`CurationV1.get_sorting()` (and `SpikeSorting.get_sorting()`) could return a sorting object that SpikeInterface rejects with `ValueError: "The sorting object has spikes exceeding the recording duration"`, blocking downstream operations like `MetricCuration.populate()`.

**Root cause**: Spike times are persisted in absolute seconds in NWB. On readback, `np.searchsorted(recording_times, spike_times)` can return an index equal to `n_samples` for spikes at/near the recording end due to floating-point round-trip imprecision. SpikeInterface's `has_exceeding_spikes` check then raises.

**Fix**: After `np.searchsorted`, drop any spike sample indices `>= n_samples` and emit a warning identifying the unit and the count removed. Removal (not clipping) ensures the returned sorting object is always valid and consistent with SpikeInterface's expectations.

## Changes

- `src/spyglass/spikesorting/v1/sorting.py`: Add module-level helper `spike_times_to_valid_samples(recording_times, spike_times, n_samples, unit_id)` that performs the searchsorted + drop-out-of-bounds + warning flow. Use it in `SpikeSorting.get_sorting()`.
- `src/spyglass/spikesorting/v1/curation.py`: Use the shared helper in `CurationV1.get_sorting()`. Both call sites now share one implementation.
- `tests/spikesorting/v1/test_curation.py`: Add two direct unit tests for the helper:
  - `test_spike_times_to_valid_samples_drops_out_of_bounds` — asserts `np.searchsorted` actually produces an out-of-bounds index on the boundary case (precondition), then asserts the helper drops it and that the resulting `NumpySorting` is accepted by SpikeInterface.
  - `test_spike_times_to_valid_samples_passthrough` — asserts in-bounds inputs are returned unchanged and equal to `np.searchsorted`.
- `CHANGELOG.md`: Entry under v0.5.6 Spikesorting bug fixes.

## Notes

The helper docstring documents that `np.searchsorted` is intentionally called with the default `side='left'` — `side='right'` would return `n_samples` for a spike that exactly equals the last timestamp and reintroduce the bug. The helper is module-level (not underscore-prefixed) since `curation.py` imports it directly.

Both `get_sorting()` methods now route through one trivial dict-comprehension calling the helper, so unit-testing the helper protects both call sites without the brittle mock-heavy `pynwb.NWBHDF5IO` / DataJoint operator mocking that an end-to-end test would require.

# Checklist:

- [ ] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [ ] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [ ] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [ ] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a4b56c1c53a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.