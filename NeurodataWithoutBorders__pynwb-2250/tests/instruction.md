# Issue

**Title:** Derive ImageSeries.num_samples from timestamps for external-file series

## Description

.

`ImageSeries.num_samples` returned `None` as soon as `external_file` was set, which skipped the `len(timestamps)` fallback in `TimeSeries.num_samples`. `get_starting_time` and `get_duration` then returned `None`, and `TimeSeriesReferenceVectorData` and `IntracellularRecordingsTable` skipped their `idx_start`/`count` bounds checks against such a series.

The frame count now comes from the timestamps when they are present. `_get_num_samples(None)` returns `None`, so an external-file series timed with `starting_time`/`rate` and no explicit `num_samples` still reports `None`.

One consequence to be aware of: the `num_samples` dataset is written from this property, so an external-file series timed with `timestamps` now persists a `num_samples` the schema doc describes as unnecessary in that case. #2239 moves the write path onto the explicitly provided value and removes that.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff2e9dc5d1aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.