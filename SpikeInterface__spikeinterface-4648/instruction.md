# Issue

**Title:** Add `SortingAnalyzer.select_channels()` function

## Description

This PR adds a `select_channels` function to the `SortingAnalyzer` that returns a new analyzer in memory with sliced recording (or attirbutes), probegroup, and properties, and extensions (with a new `_select_channels_extension_data`)

Only a few extensions are affected: `noise_levels` - `templates`

`_select_extension_data` is now renamed to `_select_units_extension_data`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d15ef3aa90d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.