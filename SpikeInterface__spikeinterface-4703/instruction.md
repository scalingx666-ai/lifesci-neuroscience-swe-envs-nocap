# Issue

**Title:** Add `GatherToZarr` and save pipeline node extension data to disk

## Description

This PR continues in the direction of support for very long chronic data. This feature prevents loading all spike vector based extension data to memory prior to saving!

- It adds a `GatherToZarr` class to save node pipeline data as it's being computed to zarr datasets.
- it modifies the `GatherToNpy` to be able to specify multiple folders for different files

These two changes allow to extend the `SortingAnalyzer`  compute functionality to directly save extension data from node pipelines computations (usually spike-vector based extensions) directly to their final location (numpy files or zarr datasets). 
This is only enabled when the `SortingAnalyzer` has a folder backend (binary folder or zarr).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15cde2779640`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.