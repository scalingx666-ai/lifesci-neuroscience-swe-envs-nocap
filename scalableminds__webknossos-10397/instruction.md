# Issue

**Title:** Activate segment ID on shift+click in Quick Select tool

## Description

### Summary

With the Quick Select tool active, a shift+click without dragging now activates the clicked segment ID, matching the other volume tools. Shift+drag still resizes the rectangle symmetrically. While Shift is held, the status bar shows "Activate Segment ID" as the left-click hint. If a preview selection is pending, it is applied with the previous ID before the new one is picked, the same as a normal click.

Previously, shift+click in AI mode started an AI selection. It now picks the segment instead.

### Steps to test:
- Open a volume annotation and select the Quick Select tool.
- Shift+click on a segment without dragging. The clicked segment becomes the active segment ID (check the status bar "Active Segment" field).
- Shift+drag. The rectangle should still resize symmetrically around its center.
- Hold Shift and hover over the viewport. The status bar should show "Activate Segment ID" as the left-click hint.
- Create a Quick Select preview, then shift+click another segment. The preview should be applied to the previous active ID before the new ID becomes active.
- Plain click and drag in Quick Select behave as before.

### Issues:
-

------
(Please delete unneeded items, merge only when none are left open)
- [ ] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfa78b7c521d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.