# Issue

**Title:** Fix: provenance handling in `SortingAnalyzer`

## Description

This PR fixes a couple of bugs:

1. in `create_binary_folder`, the provenance was incorrectly created from the `sorting` outputted by the `save()` instead of the original sorting
2. for `create_zarr`, the `SortingAnalyzer` should be instantiated with the input `sorting`, not with a `NumpySorting` copy of it
3. the `add_sorting_to_zarr_group` also adds a `provenance` entry in the sorting group (similar to the recording)

Finally, this  , by relying on the `save*` functions to store sorting provenance, instead of saving an additional provenance copy. For zarr, if the sorting is not JSON serializable, provenance will  not be saved. Readers are backward-compatible

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80aa6436dfc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.