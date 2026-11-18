# Issue

**Title:** fix: Add cache-control for data files and improve Rica modal accessibility

## Description

## Summary
This PR fixes the browser caching issue reported in #1323 and addresses PR review comments for accessibility improvements.

## Cache Control Fixes (#1323)
When users run tedana on different datasets and open Rica reports consecutively, the browser was caching data files (TSV, PNG, SVG, NIfTI) from the previous dataset because they have identical filenames.

**Changes:**
- Add `DATA_EXTENSIONS` tuple to `RicaHandler` to identify data files that should not be cached
- Extend cache-control headers to all data file types (`.tsv`, `.png`, `.svg`, `.json`, `.txt`, `.nii`, `.gz`)
- Restrict CORS to localhost origins only for security
- Add depth limit (3 levels) to file search to avoid performance issues on large directories
- Use atomic temp file downloads to avoid inconsistent cache state if download fails

## Accessibility Improvements
**HTML changes:**
- Add `role="dialog"`, `aria-modal="true"`, `aria-labelledby` to Rica modal
- Add `aria-label="Close modal"` to close button
- Add `aria-haspopup="dialog"` to trigger button

**JavaScript changes:**
- Move focus to close button when modal opens
- Return focus to trigger element when modal closes
- Trap Tab key focus within modal while open

## Defense in Depth
A complementary fix has been submitted to Rica (ME-ICA/rica#99) that adds client-side cache-busting.

## Test plan
- [ ] Run tedana on dataset A, open Rica via `python open_rica_report.py`
- [ ] Close Rica and stop the server
- [ ] Run tedana on dataset B, open Rica via `python open_rica_report.py`
- [ ] Verify dataset B's data is displayed (not dataset A's cached data)
- [ ] Test modal accessibility with keyboard navigation

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c898d269000`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.