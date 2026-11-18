# Issue

**Title:** Infer `sampling_frequency` from `Units.resolution` in `NwbSortingExtractor`

## Description

An NWB `Units` table stores spike times in seconds, so the extractor needs a `sampling_frequency` to convert them to frames. Until now it came only from an explicit argument or an `ElectricalSeries`, so a units-only file (common on DANDI) failed unless the user passed the rate by hand, even though such files usually carry it in `Units.resolution` (`1 / sampling_rate`). This reads that attribute, ranked above the `ElectricalSeries` because it is spike-native and cannot be misled by a series the sorting was not computed from (an LFP series next to a full-band sorting); `t_start` is unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `201d87c3dee2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.