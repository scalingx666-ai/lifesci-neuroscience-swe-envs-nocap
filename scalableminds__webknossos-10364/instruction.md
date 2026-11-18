# Issue

**Title:** Hide navbar download in sandbox mode and when saving is disabled

## Description

### Summary
The navbar "Download" is served by the backend, which doesn't know about local changes in sandbox mode or after "Disable saving". The download then silently omits those changes. The entry is now hidden in both cases (navbar and command palette). Read-only viewers still see it. The skeleton tab's "Download Visible Trees NML" (built from the frontend state) remains available.

### Steps to test:
- Open a dataset in sandbox mode → the Menu has no "Download" entry; the skeleton tab's NML download still works and includes the sandbox trees.
- Open an own annotation → "Download" is present. Choose "Disable saving" → "Download" disappears.
- Open someone else's shared annotation read-only → "Download" is still present.

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f030f1b4e0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.