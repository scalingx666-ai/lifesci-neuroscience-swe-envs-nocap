# Issue

**Title:** Fix `select_periods` dropping metadata, recording, times and empty segments

## Description

.

`select_sorting_periods` overwrote `sorting` before calling `copy_metadata`, so after `select_periods` the properties, annotations, registered recording and start times were lost. Segments left without spikes were also dropped, because `NumpySorting` infers the number of segments from the last spike.

This PR copies the metadata to the new sorting and carries over the recording and start times, as `NumpySorting.from_sorting` does. It adds an optional `num_segments` to `NumpySorting`, passed by `select_sorting_periods` and `from_sorting`, so that empty segments are kept and the value survives `load(sorting.to_dict())`. I did not use `register_recording`, as suggested in the issue, because it fails when the last segment has no spikes and discards a previous `shift_times()`.

With periods in the first segment only, `compute_firing_ranges`, `compute_isi_violations`, `compute_presence_ratios` and `compute_refrac_period_violations` no longer raise `IndexError`.

Not addressed: `BaseSpikeVectorExtension._get_data(periods=...)` still builds a `NumpySorting` without `num_segments`, so `compute_amplitude_cutoffs` and three other amplitude-based metrics still raise `KeyError` in that case (I can open a follow-up PR). `SharedMemorySorting` still drops trailing segments without spikes.

Claude helped me with this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e28d878e240`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.