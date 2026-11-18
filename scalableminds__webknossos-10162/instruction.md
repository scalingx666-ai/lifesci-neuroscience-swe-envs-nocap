# Issue

**Title:** Fix proofreading context menu showing supervoxel ID

## Description

### Summary

In the proofreading context menu in the data viewports, the "within Segment" label showed the supervoxel ID instead of the agglomerate (segment) ID. The label now uses the segment ID at the clicked position, which is the agglomerate ID when a mapping is active. The "Supervoxel" wording is unchanged.

### Steps to test:
- Open a dataset with a segmentation layer and an agglomerate mapping, and start proofreading.
- Right-click a segment in a data viewport, away from any skeleton node.
- Check that the menu reads "within Segment <agglomerate ID>", not the supervoxel ID.
- Check that the "Supervoxel" label still appears when proofreading is active and no mapped segment ID is available.

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcd972f561d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.