# Issue

**Title:** Override search_cached_spikes_sorted for identity selections

## Description

In #4783 an identity selection of a lazy Zarr array shares the parent's
lazy vector, but after #4809 UnitSelectionSorting inherited the
BaseSorting's search_cached_spike_sorted, which would see a non-ndarray
and raise an error.

The fix here is to just override the method and delegate the search to
the parent for identity selections. Since the identity selection
literally shares the parent's vector and segment slices, the parent's
search is guaranteed to give the right positions.

@alejoe91

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d016014fbe2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.