# Issue

**Title:** fix(web): distinguish same-title search results and complete search a11y

## Description

## Summary

- : same-title conversations show date/time and a short ID in search.
- Visible Close button (keeps Escape + backdrop).
- Results use `list` / `listitem` + buttons (not mismatched listbox).
- Arrow keys move highlight; Enter from the search field opens the active result; Tab is trapped in the dialog.

## Test plan

- [x] `searchResults.test.ts`
- [x] `tsc -b`
- [ ] Manual: two sessions named 你好 — both show dates + short IDs
- [ ] Manual: keyboard arrows + Enter + Close

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d30267b5fb78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.