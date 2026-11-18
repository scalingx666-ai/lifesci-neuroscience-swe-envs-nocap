# Issue

**Title:** Improve bounding box list hover and selected row contrast in light mode

## Description

### Summary

In light mode, the hover and selected states of the bounding box list were hard to see. antd's default hover color (`#fafafa`) is lighter than the panel background, and the selected row color (`#f0f3ff`) was too faint.

This change:
- Gives hovered rows a light gray background (`--ant-color-fill-secondary`).
- Gives selected rows the same blue as selected tree nodes (`--ant-blue-3`).
- Gives selected and hovered rows a darker blue, mixed from `blue-3` and `blue-4`.
- Restores antd's default hover and selected colors in dark mode in `dark.less`, where they already had enough contrast.

Layer bounding box rows also get the gray hover, since they are clickable.

<img width="753" height="815" alt="image" src="https://github.com/user-attachments/assets/479550e4-83d9-48c5-a108-237dbf7205de" />

<img width="753" height="918" alt="image" src="https://github.com/user-attachments/assets/6812e947-b930-4a2d-9d05-30ef200cef90" />


### Steps to test:
- Open an annotation with several bounding boxes (light mode).
- Hover a bounding box row. It should show a visible light gray background.
- Click a row to select it. It should show a clearly visible light blue background.
- Hover the selected row. It should become a darker blue than the selected state.
- Switch to dark mode and check that hover and selected rows look as before.


### Issues:
- None


------
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Updated [documentation](../blob/master/docs) if applicable
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f98f181ac2a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.