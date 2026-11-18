# Issue

**Title:** Show the full error message of prefixed errors in Airbrake

## Description

### Summary
`ErrorHandling.notifyWithPrefix` (used e.g. for "Root saga crashed" and unhandled rejections) cuts the reported message to 80 characters so that Airbrake's grouping stays stable. The full message was only sent as the `originalError` param. That is hard to find in Airbrake and gets truncated by the notifier: string limits start at 1024 characters and are halved repeatedly while a notice exceeds 64 kB (e.g. due to the action log).

Now, the full message is moved into an additional entry of `notice.errors` (an `OriginalError`, shown as the cause chain). Entries of `errors` are truncated only once (1024 characters) and never shrunk further. Airbrake groups by the first entry, so the grouping is unchanged.

I found no client-side grouping key in the Airbrake docs (grouping uses error type, message, file and environment), which is why the first error keeps the truncated message.

### Steps to test:
- Unit tests: `yarn test frontend/javascripts/test/libs/airbrake_notice_helpers.spec.ts`
- Optional, to see it in Airbrake: set `LOG_LOCAL_ERRORS = true` in `error_handling.ts` (plus project id/key in `application.conf`), run `ErrorHandling.notifyWithPrefix(new Error("x".repeat(300)), "Test: ")` in the console, and check that the notice shows a second `OriginalError` with the complete message and the same group as before.
  I could not verify the Airbrake UI rendering myself.

### Issues:
- found while debugging a collaborative proofreading report ("Root saga crashed" with a cut-off URL)

------
- [ ] Added changelog entry (not needed, no user-facing change)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8e0f6edb8d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.