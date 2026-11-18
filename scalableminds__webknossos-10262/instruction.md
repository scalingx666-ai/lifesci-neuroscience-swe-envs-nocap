# Issue

**Title:** Maximize hovered viewport via .

## Description

### Summary
Pressing `.` now maximizes the viewport under the mouse instead of the pane that has FlexLayout tab focus. Here is how the target tabset is picked:
- If a pane is already maximized, `.` restores it.
- Otherwise the tabset with the hovered viewport (`activeViewport` from the store) is maximized. In flight/oblique mode, the flight viewport is used.
- If no viewport tabset is found, the focused tabset is used as before.

When the mouse is over a sidebar, the last hovered viewport is maximized. Sidebar tabs live in borders and can't be maximized anyway.

### Steps to test:
- Open an annotation in orthogonal mode. Click into the XY viewport's tab header so it has focus, then hover the 3D viewport and press `.`. The 3D viewport should be maximized.
- Press `.` again. The layout should be restored, including the sidebars.
- Hover the YZ viewport and press `.`. YZ should be maximized.
- Switch to flight or oblique mode and press `.`. The flight viewport should toggle between maximized and restored.

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbbed8a9c215`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.