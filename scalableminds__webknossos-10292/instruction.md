# Issue

**Title:** Make remaining volume tools part of new volume architecture

## Description

### Summary
Moves the remaining volume tools onto the new volume architecture, so that all of them can save partial bucket updates in live collaboration.
- **Trace, erase-trace and quick select:** `labelWithVoxelBuffer2D` turns their 2D region into a `MaskShape` and labels it with `runMaskEdit`, instead of labeling each mag on its own.
- **`api.data.labelVoxels`:** labels its voxels with the new `runVoxelsEdit` (transaction write cursors, no mask) and no longer throws in live collaboration.
- **Live collaboration:** with the `allowCollaborativeVolumeAnnotation` dev flag, all volume tools are enabled there (previously only brush, eraser and fill tool). The flag stays off for users.
- The old labeling code becomes unused; it's removed in the stacked follow-up PR.

### Steps to test:
- Trace and erase-trace, quick select (heuristic and ML) and `webknossos.apiReady().then(api => api.data.labelVoxels(...))` work as before, including undo, also on a layer without mag 1.
- With `webknossos.DEV.flags.liveCollaboration.allowCollaborativeVolumeAnnotation = true` and simultaneous editing enabled, these tools are available, and the save requests contain `updateBucketPartial` instead of `updateBucket`.

### Issues:
- contributes to #9982

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d7dfa291a7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.