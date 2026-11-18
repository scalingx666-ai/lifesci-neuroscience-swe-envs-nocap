# Issue

**Title:** fix(web): surface message copy success and failure feedback

## Description

## Summary

- : Copy message no longer silently ignores clipboard failures.
- `copyTextToClipboard` returns explicit ok / denied / unavailable / failed.
- Success: checkmark + “Copied” for 2s; failure: error icon + reason for 3s.
- Polite `aria-live` region announces the result; button label/title match.
- Covers all message roles that expose the copy control via shared `copyButtonFor`.

## Test plan

- [x] `copyToClipboard.test.ts` (success, denied, unavailable, failed)
- [x] `tsc -b` for web package
- [ ] Manual: copy succeeds → green check + announcement
- [ ] Manual: deny clipboard / insecure context failure → red error, no false success

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40f5f363d3e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.