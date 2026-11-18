# Issue

**Title:** Build the `NwbSortingExtractor` spike vector with a single bulk read

## Description

`NwbSortingExtractor` now overrides `_compute_and_cache_spike_vector` to build the whole spike vector from one read of the Units table instead of the generic per-unit loop it inherits from `BaseSorting`. An NWB (Neurodata Without Borders) Units table stores every unit's spikes in a single flat `spike_times` dataset grouped by unit, with the per-unit boundaries in `spike_times_index`, so the entire table can be read in one shot and each spike's unit index recovered from those boundaries. The generic builder instead reads one spike train per unit, which is one streamed read per unit; for a remote or streamed file that is the difference between a single request and one request per unit. Construction stays lazy as before: nothing is read until the spike vector is first requested.

The seconds-to-samples conversion stays on the segment, shared by the per-unit and bulk paths through `_times_to_frames`, and the override only assembles and sorts the structured array, so its output is byte-for-byte identical to the generic builder. Correctness is therefore already exercised by the existing NWB (Neurodata Without Borders) roundtrip tests, and a comment on the override records why it should not be reverted to the generic per-unit path.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcdfc1a2275e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.