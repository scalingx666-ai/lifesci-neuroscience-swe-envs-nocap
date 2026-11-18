# Issue

**Title:** Fix row action tooltips flipping over the row at the panel edge

## Description

### Summary

Tooltips on row action buttons in the right border tabs (segments list, shared list rows) were centered above the buttons. The buttons sit at the right edge of the viewport, so the tooltip overflowed and react-tooltip flipped it to the left of the button, over the row. Action tooltips now use `top-end` placement, which keeps them above the button and aligned to its right edge.

- Adds `ACTION_TOOLTIP_PLACEMENT` in `shared/list_row.tsx` and applies it to `RowActionButton` and the segment row's action buttons (center in viewports, more actions, mesh chip and ad-hoc compute mesh).

### Steps to test:
- Open the segments tab in the right border panel with a few segments listed, and make sure a row is near the right edge of the panel.
- Hover the row so its action buttons appear, then hover each button: "Center in viewports", "More actions (also available via right-click)", and the mesh control ("Compute mesh (ad-hoc)" or the mesh chip tooltip).
- Verify each tooltip appears above its button, right-aligned to it, and does not cover the row.
- Check the same behavior for other lists that use `RowActionButton` in the right border tabs.

### Issues:
- fixes #

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59627dc51581`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.