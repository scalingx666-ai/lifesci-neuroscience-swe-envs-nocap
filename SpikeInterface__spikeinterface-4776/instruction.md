# Issue

**Title:** Fix ComputeACG3D soft merge indexing bug that swaps kept units' data

## Description

.

@Arthur031221's issue already has the full diagnosis and a fix in this same shape, this PR just implements it. I re-verified it against current `main` rather than taking it as given.

`SortingAnalyzer.merge_units(..., merging_mode="soft")` — the default — silently corrupts the `acgs_3d` extension for kept units whose index shifts during the merge. `ComputeACG3D._merge_extension_data` computes `old_unit_ids_indices` against the merged sorting, then reuses that same index array to read `self.data["acgs_3d"]` and `["firing_quantiles"]` — but those arrays are still laid out in the pre-merge sorting's order. So a kept unit whose index shifted this way comes back holding another unit's 3D-ACG and firing-rate quantiles, with no error and matching shapes, and nothing catches it.

`ComputeAutoCorrelograms` (same module) and `ComputeUnitLocations` (`unit_locations.py`) already do this correctly: they look up `self.sorting_analyzer.sorting.id_to_index(unit_id)` on the pre-merge sorting for kept units. This fix makes `ComputeACG3D` do the same thing: it reads the source rows from the sorting the data was actually computed against, and writes them to the destination rows of the merged one.

The regression test (`test_acgs_3d_merge`) is adapted almost verbatim from the issue, and I extended it to also cover sparse analyzers and a multi-segment recording. It fails on unpatched `main` and passes with the fix, across merge groups at the start, middle and end of the unit list, and both `new_id_strategy` values. `python -m pytest src/spikeinterface/postprocessing -q` and `.../core -q` still pass otherwise.

Two more things from the issue I left untouched here. `test_multi_extensions.py`'s merge/split check lists 14 extensions and `acgs_3d` isn't one of them, which is likely why this went unnoticed. Also, the `bins` value this method returns still reflects the pre-merge unit count after a merge (excluded from the new test's comparison, commented why) — a separate, pre-existing bug in `ComputeACG3D`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf0f01b7e419`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.