# Issue

**Title:** Group viewer menu entries into labeled sections

## Description

### Summary

The viewer's `Menu` dropdown had grown without an order. It is now split into three labeled sections: **Annotation**, **Share & Export**, and **Customize**. Sections without visible entries are hidden. The dataset view and the annotation view share the same section definitions in `menu_groups.ts`, so the two menus stay consistent.

Along with the regrouping:
- Renamed entries: "Restore Older Version" → "Version History", "Keyboard Shortcuts" → "Configure Shortcuts", "Add Script" → "User Scripts" (now with a code icon), "Screenshot (Q)" → "Screenshot".
- "Archive" / "Finish and go to Dashboard" is the last entry in the Annotation section, so it is less likely to be clicked by accident.
- The command palette reuses the same entries as a flat list, so it shows the new names.
- `useTracingViewMenuItems` is renamed to `useTracingViewMenuGroups` because it now returns sections.
- Undo/redo hint messages and the docs (`docs/ui/toolbar.md` and related pages) use the new names. The shortcut docs now point to `Menu` → "Configure Shortcuts".

Not included: "User Scripts" is not yet in the dataset-view menu.

### Steps to test:
- Open an annotation you own in the viewer. Check that the `Menu` shows the sections Annotation, Share & Export, and Customize, in that order, and that "Archive" / "Finish and go to Dashboard" is the last item in Annotation.
- Open the same annotation logged out. Check that the Annotation section shows only a disabled "Version History" entry and that the other sections still work.
- Open a dataset in view mode. Check that the Annotation section is hidden and that Share & Export and Customize show the expected entries, including "Configure Shortcuts".
- Click "Version History", "Configure Shortcuts", and "User Scripts" and confirm each opens its dialog.
- Open the command palette in an annotation and in a dataset. Check that the menu entries appear under their new names.
- Check the light and dark themes.

### Issues:
- none

------
(Please delete unneeded items, merge only when none are left open)
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Added migration guide entry if applicable (edit the same file as for the changelog)
- [x] Updated [documentation](../blob/master/docs) if applicable
- [ ] Adapted [wk-libs python client](https://github.com/scalableminds/webknossos-libs/tree/master/webknossos/webknossos/client) if relevant API parts change
- [ ] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [ ] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9625d2aaa3bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.