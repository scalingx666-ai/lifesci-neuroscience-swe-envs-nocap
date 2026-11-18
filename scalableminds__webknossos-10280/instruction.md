# Issue

**Title:** Fix ad-hoc meshing error when the segmentation layer is hidden

## Description

### Summary
Loading an ad-hoc mesh threw "visible segmentation layer must not be null" if the segmentation layer was hidden while queued meshes waited for a worker (reported to Airbrake).

`loadFullAdHocMesh` already gets the layer to mesh, but it looked up the visible segmentation layer and the active volume tracing to decide which tracing and data source to use. It now uses only `layer`: the volume tracing comes from `getVolumeTracingByLayerName`, and the data store layer from `layer.fallbackLayer ?? layer.name`. Meshing a hidden layer now works normally instead of failing.

Split out of #10278.

### Steps to test:
- Load several ad-hoc meshes and hide the segmentation layer right away. The meshes finish loading and there's no error toast or console error.
- In an annotation with a volume layer (with and without a fallback layer, with and without an editable mapping), ad-hoc meshing still works.

### Issues:
- Related: #10278

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d14047539ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.