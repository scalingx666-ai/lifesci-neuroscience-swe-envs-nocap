# Issue

**Title:** Respect requested unit order for templates and sparsity in SortingAnalyzer.select_units

## Description

## Commit 1

Bug: When calling `SortingAnalyzer.select_units()`, the new analyzer's `unit_ids` follow the order passed to `select_units()`, but `select_units()` copies the templates and the channel sparsity from the parent in the parent's order. The analyzer reads row `i` of those arrays as `unit_ids[I]`, so a selection that is not in the parent's order gives units each other's templates and sparsity without raising an error.

Fix: index both by `ids_to_indices(unit_ids)`, like the other per-unit extensions.

## Commit 2

Bug: The selected ACGs were stored under `"ccgs"`, so calling `get_data()` on an analyzer produced by `select_units()` raised `KeyError("acgs")`.  

Fix: Store ACGs under "acts".

## Commit 3

Problem: `AnalyzerExtensionCommonTestSuite` only tested a reversed-order `select_units()` on `unit_locations`.

Fix: Add the missing tests.

## Commit 4

There were a bunch of places where mapping unit ids to indices with `np.flatnonzero(np.isin(analyzer.unit_ids, unit_ids))` produced correct behavior, but since this is the pattern that caused the earlier bug, it seemed prudent to just use `sorting.ids_to_indices(unit_ids)` everywhere so there's only one, safe idiom in use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06abf015465a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.