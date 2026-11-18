# Issue

**Title:** fix(web): surface persistent-library files in mentions

## Description

## Summary
- merge current-session `/workspace` and persistent-library `/data` entries in the composer mention picker, with explicit scope labels for duplicate filenames
- refresh mention candidates after persistent uploads, edits, and deletes while preventing stale async listings from overwriting newer results
- insert safe logical-path references from keyboard/click selection, including filenames containing backticks
- add a **Use in conversation** action to file preview that appends the reference, closes Files, and returns focus to the composer without bypassing unsaved-edit protection

## Verification
- production Web build passed
- Web suite: 67 files, 550 tests passed
- repository suite: 95 files, 1063 tests passed
- Safari real-flow QA: duplicate filename scopes, `@ux` filtering, Enter selection, preview-to-composer focus, real persistent upload, and immediate `@live` discovery without page reload

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d2812ec684b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.