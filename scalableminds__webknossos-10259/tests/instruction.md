# Issue

**Title:** Copy precise length from tree measurement notifications

## Description

### Summary
Length measurement notifications (tree length via context menu or skeleton tab, total length of all skeletons, shortest path between nodes) now show a copy icon next to the rounded physical length. Clicking it copies the precise, unrounded length in the dataset's base unit (e.g. nm) to the clipboard.

The copied value is the bare number without unit, so it can be pasted directly into spreadsheets/scripts. The unit is stated in the icon tooltip and the success toast ("Copied length in nm “12345.678…” to clipboard.").

### Steps to test:
- Open a skeleton annotation with a tree of several nodes.
- Right-click a node > "Measure Tree Length", and in the skeleton tab: right-click a tree > measure tree length; toolbar > measure all skeletons; select two nodes and measure the path between them.
- Each notification shows a copy icon after the physical length. Click it: a success toast appears and the clipboard contains the unrounded number in the dataset unit.

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e87648543d5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.