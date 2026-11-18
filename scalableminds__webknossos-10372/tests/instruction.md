# Issue

**Title:** Fix removed active segment reappearing in the segment list

## Description

### Summary
- When the user removed the active segment from the segment list in proofreading mode, it reappeared a few seconds later. The proofreading marker still pointed to it, and `adaptActiveSegmentToProofreadingMarker` re-created the segment item when the id at the marker briefly changed during a local mapping update.
- The marker and the active segment are now kept in sync: if the user changes the active segment in another way than a proofreading click (e.g., "Activate Segment ID" in the segment list, a click in the 3D viewport, creating a new segment id), the marker is cleared. Previously, the marker stayed on the old segment and the next mapping update switched the active segment back to it.
- The marker is cleared when the active segment is removed (segment list, deleting a segment group with its segments or the root group, `api.tracing.removeSegment`). A saga listens to `REMOVE_SEGMENT` for this. Removals by other users and the merging of segment items are applied by reducers directly and don't reach the saga, so the marker stays then. Removals during a proofreading operation (cleanup of outdated agglomerate ids) are ignored, so that the active segment can still be adapted to the new id.
- Tests: `proofreading_marker.spec.ts`.
- The underlying problem (switching the active segment to ids that the local mapping doesn't know yet) is addressed in the stacked follow-up PR #10371.

### Steps to test:
- Open an annotation with an HDF5 mapping, use the proofreading tool and click a segment so that the marker is set.
- Remove the active segment from the segment list (single or multi-selection) → the marker disappears and the segment does not reappear, also not after moving the camera far away and back.
- Deleting a group that contains the active segment (with its segments, or the root group) also clears the marker.
- Removing a segment that is not the active one keeps the marker.
- With a marker set, use "Activate Segment ID" on another segment in the list → the marker disappears and the active segment stays (it isn't switched back after moving the camera).

### Issues:
- reported by a user (segment reappears after removing it from the list)

------
- [x] Added changelog entry
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b60479e6361f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.