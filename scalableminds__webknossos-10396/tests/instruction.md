# Issue

**Title:** Add Shift+click range selection to the segments list

## Description

### Summary

- Shift+click in the segments tab now selects every segment between the previously clicked segment and the clicked one, including both ends. This mirrors the range selection in the skeleton tab.
- The range starts from the last segment clicked without Shift. It stays fixed while further Shift-clicks adjust the range. If that segment is no longer selected, the most recently selected segment is used instead.
- Range selection only works within a single group. Shift-clicking a segment in a different group does nothing.
- Adds a helper `getSegmentIdsInRange` with unit tests, and documents the shortcut in the segments list docs.

### Steps to test:
- Open the segments tab of an annotation with several segments in the same group.
- Click one segment, then Shift+click another segment further down the list. All segments between them, including both ends, should be selected.
- Shift+click a segment that is higher up. The range should update to span the anchor and the new target.
- Click a segment in the viewport, then Shift+click a segment in the list. The range should start from the most recently selected segment.
- Shift+click a segment in a different group. Nothing should change.

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2e31f1c8208`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.