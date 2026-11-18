# Issue

**Title:** Highlight and fill bounding boxes in the 2D viewports from the bounding box tab

## Description

### Summary

Hovering a bounding box row in the right sidebar now highlights that box in the rendered viewports. Selecting a row fills the box's cross sections in the 2D viewports, and the fill is removed again when the selection is cleared. 

A selected box can be unselected by clicking its row again or by clicking the empty background of the bounding box tab. Clicks on controls inside a row (name field, visibility toggle, colour, buttons) do not unselect. Ctrl/Cmd multi-selection still works as before. Layer bounding box rows are not affected.

https://github.com/user-attachments/assets/d52b2183-875e-4879-83de-45395182100e


### Steps to test:
- Open a annotation with several user bounding boxes and open the Bounding boxes tab in the right sidebar.
- Hover a bounding box row: its outline should be highlighted in the 2D viewports and the highlight should disappear when the mouse leaves the row.
- Click a row: the box should be filled in the 2D viewports.
- Click the name field, visibility toggle or colour of the selected row: the box should stay selected.
- Click the selected row again: the box should be unselected and the fill removed.
- Select a row again, then click the empty background of the tab: the box should be unselected.
- Select a box by clicking it in a viewport: the matching row should be selected in the list.
- Ctrl/Cmd-click several rows: they should stay selected together, and clicking the empty background should clear them.
- Check the context menu, popovers (search, MIP settings) and toolbar buttons such as "delete selected": they should not unselect the box.


### Issues:
- None


------
(Please delete unneeded items, merge only when none are left open)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [ ] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [ ] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b769b0a57ce9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.