# Issue

**Title:** Clarify folder actions and simplify help panel header

## Description

### Summary
- Dashboard folder sidebar: rename the ambiguous "Edit" / "Delete" actions to "Edit Folder" / "Delete Folder".
- Help panel: remove the subtitle under "Help", which repeated the mode tabs below it.

### Steps to test:
- Dashboard, no dataset selected: the sidebar actions read "Edit Folder" and "Delete Folder".
- Open the help panel in the viewer: the header only shows "Help"; both tabs still work.

### Issues:
- none

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48531e70eb7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.