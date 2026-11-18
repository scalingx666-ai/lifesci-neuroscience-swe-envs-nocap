# Issue

**Title:** Fix segment groups being deleted when clicking a segment of a hidden layer

## Description

### Summary
- When the volume layer was hidden (disabled or opacity 0), `CLICK_SEGMENT` and `SET_EXPANDED_SEGMENT_GROUPS` read the segment groups of the *visible* layer (none) and wrote them to the volume layer. This deleted all segment groups and ungrouped all segments. A proofreading split triggers `CLICK_SEGMENT` for the resulting segments, so splitting in the 3D view with the segmentation layer hidden wiped all groups (also those of other users in collaborative annotations). Both reducers now read from the layer they write to.
- `updateSegmentPartial` ignored `null` values (e.g. `groupId: null`) because the tristate json parsing needs `Some(None)` defaults. As a result, the server kept segments in deleted groups, which made them invisible in the segments tab after a reload. `null` now unsets the property.

### Steps to test:
- Open a volume annotation with segment groups containing segments.
- Use the proofreading tool to split an agglomerate in the 3D viewport.
- Immediately, hit "3" to toggle the segmentation layer (this deletes the segment groups now because `CLICK_SEGMENT` is handled while no segmentation layer is visible)

### Issues:
- reported by a user doing collaborative proofreading
- https://scm.slack.com/archives/C02H5T8Q08P/p1792498138155059

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fda62cfa138`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.