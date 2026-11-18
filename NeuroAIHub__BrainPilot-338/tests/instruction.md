# Issue

**Title:** fix(web): make conversation rename/delete keyboard-accessible

## Description

## Summary

- : conversation rename and delete confirmation are keyboard- and screen-reader-complete.
- Rename input has an accessible label identifying the conversation; Save is disabled for empty/unchanged titles with validation feedback.
- Enter commits a valid rename; Escape cancels rename without changing the title.
- Delete confirmation shows risk text and named **Confirm delete** / **Cancel** actions; Escape cancels and restores focus.
- `IconButton` now forwards refs for focus return; pure helpers cover commit/validation rules.

## Test plan

- [x] `sessionListA11y.test.tsx` (validation + idle markup)
- [x] `tsc -b` for web package
- [ ] Manual: keyboard rename (label, Save disabled, Enter/Escape)
- [ ] Manual: keyboard delete confirm (visible text, Escape, focus return)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91649840bd0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.