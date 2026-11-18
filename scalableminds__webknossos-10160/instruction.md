# Issue

**Title:** Fix materialize bounding box error text and Voxelytics report link visibility

## Description

### Summary
- The bounding box size error in the "Merge this volume annotation with its fallback layer" (materialize) dialog said "The AI neuron segmentation trial is only supported for …", copied from the AI job dialogs. It now uses neutral wording.
- The `Voxelytics Report` button on the AI Models page is now only shown if Voxelytics is enabled (`features.voxelyticsEnabled`), like the navbar entry. Previously, it linked to a non-working workflow page on instances without Voxelytics.

### Steps to test:
- Materialize a proofreading volume annotation as a non-superuser with a bounding box larger than the TIFF export limit → error message no longer mentions the AI neuron segmentation trial.
- With `features.voxelyticsEnabled = false`, open `Analysis > AI Models` → no `Voxelytics Report` button for trained models. With it enabled, the button is shown as before.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d283e3a71d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.