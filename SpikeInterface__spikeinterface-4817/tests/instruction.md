# Issue

**Title:** Rename the spike vector caches to state which order they hold

## Description

I am not present in the library as much as I would like, and every time I come back I face the same problem of remembering what is the spike vector and what is the lexsorted one. I propose the following renames. I hope they improve clarity and help me remember what the two representations are for without having to look it up:

* `_cached_spike_vector` -> `_cached_time_ordered` dict, with `spikes`|`segment_slices` fields
* `_cached_lexsorted_spike_vector` -> `_cached_unit_grouped` dict, with `spikes`|`unit_segment_slices` fields
* `_cached_spike_vector_to_indices` -> `_cached_time_ordered_indices_by_unit`
* `_cached_spike_vector_segment_slices` -> removed, now `_cached_time_ordered["segment_slices"]`

These are private attributes and none of them is serialized (pickling goes through `to_dict()`). Saved objects are not affected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `948ff2b75f59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.