# Issue

**Title:** Apply JSON mappings natively via the bucket scanner

## Description

### Summary

JSON mappings are now applied to the raw bytes of a bucket using the native bucket scanner, instead of mapping every voxel through a boxed Scala `Map`. Distinct segment ids are collected natively, only those are looked up in the mapping, and the voxels are rewritten natively. Ids are normalized to the layer's element width, so results match the previous per-voxel behaviour, and unmapped ids stay unchanged.

Ad-hoc mesh requests now apply the JSON mapping before converting to a typed array, which avoids a round trip. The `AbstractDataLayerMapping` trait is removed because it is no longer needed.

In a benchmark with a 1M-entry mapping on 32³ and 64³ buckets, the mapping step is about 7–11× faster.

### Steps to test:
- Run `yarn test-backend`. The new `JsonMappingTestSuite` compares the native implementation against the previous per-voxel one for all segmentation element classes, including edge-case ids.
- Open a segmentation layer with a JSON mapping enabled and request an ad-hoc mesh for a mapped segment. The mesh should match the output from before this change.

------
(Please delete unneeded items, merge only when none are left open)
- [ ] After review: delete the old-implementation reference in `JsonMappingTestSuite`, replace it with explicit expected values and a `Long`-based oracle, and make `MappingParser`/`DataLayerMapping` plain `Long` (see inline comments)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c11b3c6775b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.