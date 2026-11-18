# Issue

**Title:** Read the last spike from the unit end offsets in `NwbSortingExtractor`

## Description

This is another PR to avoid building the spike vector cache when a query does not need it, like #4811, which lets callers that read each unit once skip the unit-grouped cache. Here, `get_last_spike_frame` builds the spike vector only to take its maximum, and `get_end_time` calls it when the sorting has no recording. For NWB this means reading every spike time, converting all of them to samples and sorting them by time, just to get one number.

To solve this I override the method in `NwbSortingExtractor` to read only the last spike of each unit, using the unit end offsets in `spike_times_index`, and take the maximum. pynwb computes `Units.get_starting_time()` and `Units.get_duration()` the same way, from the boundary spikes of each unit (NeurodataWithoutBorders/pynwb#2164), but I can't call them here because the extractor reads the file with h5py or zarr by default. This is part of #4702 and came up in #4645, which builds a `SortingAnalyzer` without a recording and needs the last spike to size its placeholder recording.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.