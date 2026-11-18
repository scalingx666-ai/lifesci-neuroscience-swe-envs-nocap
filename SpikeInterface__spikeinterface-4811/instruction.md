# Issue

**Title:** Enable case omission  on `get_unit_spike_train_in_seconds`

## Description

When working on a conversion where I used a `NumpySorting` to bring the spikes that the users had in their CSV files into a pipeline, I realized that writing a units table of 127 million spikes with neuroconv's `add_sorting_to_nwbfile` held 7.7 GiB, for spike times that are about 1 GB as float64. About half of that is the cache that `get_unit_spike_train` builds when asked for spike times in seconds. When reading one spike train at a time that cache is unnecessary. Only the spikes of the unit being read need to be in memory, but the cache is a copy of the whole spike vector sorted by unit plus an order array, and it stays allocated as long as the sorting does.

Right now `get_unit_spike_train_in_seconds` hardcodes `use_cache=True`, and `get_unit_spike_train(return_times=True)` drops the `use_cache` it receives. This PR adds `use_cache` to `get_unit_spike_train_in_seconds` and passes it in both places, with `True` as the default as before. A caller like `add_sorting_to_nwbfile` can then skip the cache.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1666a0eabde7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.