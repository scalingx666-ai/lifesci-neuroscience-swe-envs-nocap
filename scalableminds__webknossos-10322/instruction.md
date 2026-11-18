# Issue

**Title:** Add "Open in WEBKNOSSOS" button to Voxelytics task headers

## Description

### Summary

Voxelytics task panels now show an "Open in WEBKNOSSOS" button in their collapsible header when one of the task's output artifacts links to webknossos.org or to the current WEBKNOSSOS instance. The button opens the link in a new tab and does not toggle the panel. Tasks without such a link are unchanged.

### Steps to test:
- Enable `voxelyticsEnabled` in the local config and start the backend.
- Open a Voxelytics workflow that has a task whose output artifact links to `webknossos.org` (or to this instance). The task header should show the "Open in WEBKNOSSOS" button.
- Click the button. The link should open in a new tab, and the panel should not expand or collapse.
- Check a task whose artifacts only link elsewhere (e.g. a TensorBoard URL). It should show no button.

### Issues:
- none

------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b4c649a2d8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.