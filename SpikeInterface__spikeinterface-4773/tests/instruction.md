# Issue

**Title:** Fix main_channel_id donor selection when merged units disagree

## Description

`merge_units()` gives the merged unit `main_channel_id` from whichever unit is listed first in the merge group on any disagreement, not from the one with the most spikes like the comment says: `np.argmax(num_spikes_per_unit.values())` runs on a `dict_values` view NumPy can't iterate (no `__getitem__`), so it always returns `0`.

Minimal proof: 3 units with spike counts 8/5/7, merging `["b", "a"]` returns `chB` (fewer spikes) instead of `chA` on `main`. `main_channel_id` is set by default for every `SortingAnalyzer` since #4624.

Fix: look the count up by unit id instead of trusting `argmax`/position. Doesn't touch the neighbouring note about recomputing from templates for analyzers — only makes the existing spike-count fallback do what its own comment says.

Two regression tests (`test_sorting_tools.py`, `test_sortinganalyzer.py`, covering both `apply_merges_to_sorting` and `SortingAnalyzer.merge_units()`) fail on `main`, pass patched; 48 tests total, black clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `297da5eb9c02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.