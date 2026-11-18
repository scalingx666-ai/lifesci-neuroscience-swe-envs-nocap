# Issue

**Title:** Map NWB sorting spikes to samples via the ElectricalSeries timestamps

## Description

An NWB `Units` table stores spikes as times in seconds, and `NwbSortingExtractor` converts them to samples. Until now it always used a single `(sampling_frequency, t_start)` linear formula, even when the ElectricalSeries stored an irregular clock as a `timestamps` array. On a non-uniform clock (a recording gap, or drift) a single estimated rate is a fiction, so spikes landed on the wrong samples, off by up to the size of the gap (thousands of samples in practice). When `electrical_series_path` is passed and the series is timestamps-based, spikes are now mapped to their exact sample with a `searchsorted` into the timestamps; a rate-based series is uniform and keeps the linear path unchanged.

I kept the timestamps as a lazy handle and materialize them once, only on the first frame request, so `get_unit_spike_train_in_seconds` and rate-based files pay nothing: the load happens only for a genuinely irregular clock and only when frames are actually needed. I also renamed `rate_and_t_start_from_electrical_series` to `fetch_time_info_from_electrical_series`, since it now returns the timestamps alongside the rate and `t_start`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf369c3bc119`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.