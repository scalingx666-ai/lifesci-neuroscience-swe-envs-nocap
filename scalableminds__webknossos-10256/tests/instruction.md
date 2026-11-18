# Issue

**Title:** Save node comments on blur instead of on every keystroke

## Description

### Summary
The comment input in the comments tab dispatched a comment update on every keystroke, so undoing an edit took one step per typed character. It now uses `InputWithUpdateOnBlur` (like tree names) and saves on blur/Enter/Escape; unchanged values are not saved. Enter no longer blurs the input, matching tree name editing.

### Steps to test:
- Open a skeleton annotation, select a node and type a comment in the comments tab
- Click into the viewport (or press Enter/Escape); the comment is saved
- Press Ctrl+Z once; the whole edit is undone
- Focus and blur the input without changes; no undo step is added

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd403ddb3404`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.