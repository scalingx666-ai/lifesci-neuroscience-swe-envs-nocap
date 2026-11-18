# Issue

**Title:** Validate animation bounding box lies within color layer

## Description

### Summary
The Create Animation modal silently cropped a user bounding box that only partially overlapped the selected color layer. It now shows an error when the bounding box is not fully contained within the color layer's bounds. A box fully outside the layer still gets the existing error message.

### Steps to test:
1. Open a dataset and open Create Animation.
2. Select a user bounding box that partially extends past the color layer. An error should be shown.
3. Select a user bounding box fully inside the color layer. The job should start.
4. Select "Full layer". The validation should pass.

### Issues:
- none

------
(Please delete unneeded items, merge only when none are left open)
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [ ] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3787a0f94324`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.