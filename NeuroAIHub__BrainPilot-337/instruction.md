# Issue

**Title:** fix(web): restore active conversation after reload

## Description

## Summary

- : reloading no longer drops into a New Conversation draft when persisted sessions exist.
- Session-list status (`idle | loading | ready | error`) gates auto-draft — draft only after list confirms empty.
- Persists last selected session id (`bp.web.lastSessionId`) and restores it when still present.
- Documented fallback: most recently updated session (`sorted[0]`) when preferred is missing.
- Pure `resolveSessionSelection` / `shouldAutoStartDraft` helpers with unit coverage for delayed load, preferred hit/miss, and empty list.

## Test plan

- [x] `sessionSelection.test.ts` (14 cases)
- [x] `tsc -b` for web package
- [ ] Manual: open a conversation, reload — same conversation restored
- [ ] Manual: delete that conversation elsewhere, reload — falls back to another session without draft flash
- [ ] Manual: empty workspace — draft only after list returns empty

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7dea6d19a352`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.