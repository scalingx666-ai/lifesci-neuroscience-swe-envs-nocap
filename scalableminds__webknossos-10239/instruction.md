# Issue

**Title:** Report failed rebasing with its reason to Airbrake

## Description

### Summary
If rebasing fails (`performRebasingIfNecessary` returns `successful: false`), WEBKNOSSOS cannot recover: the user is asked to reload and the version polling saga sleeps for 5 minutes before trying again. This should not happen in the first place, but when it does, we want to know why. Before this PR, only two of the failure paths notified Airbrake, and without context.

Now:
- Every failure path returns a `RebasingFailure` with a stable `reason` (without ids, so Airbrake groups the reports) and optional `details`:
  - legacy actions, `mergeAgglomerate` without agglomerate ids, failed foreign split, failed rewrite/re-apply of the save queue, full rebase outside of Concurrent mode, exceptions.
  - The rebasing phase (`applyMissingUpdateActions` / `reapplySaveQueue`) is added to the details.
- `version_poll_saga` reports the failure once (message `Rebasing failed: <reason>`) with the annotation id/version, the collaboration mode, the active operations and `isCallerWaiting`. The last two show which operation stays blocked, because the callbacks of the request that triggered the rebase are not resolved.
- Expected failures (another user reverted the annotation or changed its layers) are reported as warnings. Exceptions are reported with their stack via `notifyWithPrefix`.
- The two previous `ErrorHandling.notify` calls in `rebasing_sagas.ts` were removed (now reported centrally, so there are no duplicates).

The behavior for the user (toasts, 5 minute sleep, unresolved callbacks) is unchanged.

### Steps to test:
- `yarn test frontend/javascripts/test/sagas/saving/rebasing_failure_reporting.spec.ts` (a newer version with a legacy action → error report with reason; a foreign revert → warning).

### Issues:
- follow-up of debugging a collaborative proofreading report

------
- [ ] Added changelog entry (not needed, no user-facing change)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91cf1871654a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.