# Issue

**Title:** Undo red UI error highlighting when leaving viewer

## Description

### Summary
When saving failed, the red save-error highlighting and the sticky "save failed" toasts stayed visible after leaving the annotation view without a page reload, e.g. when navigating to the dashboard.

- The save-error state now lives in the store (`state.save.hasSaveError`) instead of a `save-error` class on `document.body`. The navbar renders the red highlighting from it. Resetting the store when the annotation view unmounts therefore also removes the highlighting.
- The toasts are not part of the store, so the annotation view closes them explicitly when it unmounts.
- The red color is now limited to the navbar and its menus. Before, it also applied to all dropdowns and popovers opened anywhere on the page.

### Steps to test:
- Open an annotation and make saving fail (e.g. block the tracingstore `update` requests in the browser dev tools), then edit something.
- Wait until the red navbar and the "save failed" toast appear.
- Navigate to the dashboard via the navbar (no reload).
- The red navbar and the toast should be gone.

### Issues:
- fixes https://scm.slack.com/archives/C5AKLAV0B/p1792741532183259

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c767fa7d9ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.