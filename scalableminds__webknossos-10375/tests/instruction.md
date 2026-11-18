# Issue

**Title:** Match native scrollbars to the selected theme

## Description

### Summary

Native scrollbars now follow the selected theme. Dark mode no longer shows bright scrollbars.

The theme provider sets `color-scheme` and `scrollbar-color` on `<html>` whenever the theme changes. Setting them on `<html>` means the page scrollbar and portaled modals and dropdowns also pick up the theme. Scrollbar colors come from the existing design tokens: a light thumb in dark mode and a dark thumb in light mode, with a transparent track in both.

Antd's virtualized `<Tree>` draws its own scrollbar and is not affected by this change. It keeps its existing override.

### Steps to test:
- Set the user theme to dark in the user settings. Confirm that the page scrollbar, the scrollbars in a modal, and the scrollbar in a dropdown are dark-styled.
- Set the theme to light. Confirm the scrollbars are light-styled again.
- Set the theme to auto and change the OS appearance. Confirm the scrollbars follow the change.
- On macOS with overlay scrollbars, Chrome may partly ignore `scrollbar-color`. `color-scheme` should still apply.

### Issues:
-

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb45801070b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.