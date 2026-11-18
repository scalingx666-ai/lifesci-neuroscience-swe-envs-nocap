# Issue

**Title:** Use ApiResult for getUpdateActionLog and retry polling without limit (4/n)

## Description

> Stacked on #10239 (both touch `performRebasingIfNecessary`). Please merge #10239 first; GitHub will then retarget this PR to `master`.

### Summary
`getUpdateActionLog` threw when the tracing store was unreachable (after 3 retries, ~14 s). `fetchNewestMissingUpdateActions` is called outside of the try/catch in `performRebasingIfNecessary`, so the exception terminated the version polling saga and crashed the root saga. In annotations that others may edit, this request is made every 10 s, so a short tracing store outage was enough.

Now:
- `getUpdateActionLog` returns `Promise<ApiResult<…>>` (same retry timing as before by default: 2 s, 4 s, 8 s).
- For rebasing, the request is retried **without limit** (exponential backoff starting at 1 s, at most 1 minute between attempts). Rebasing cannot continue without these update actions, so the client waits until the server is back. Meanwhile, the `REBASE` operation stays registered (UI blocked in collaborative modes; the watchdog from #10218 reports it after 20 s).
- Errors that are not retried (e.g. 4xx) are returned as a failed rebasing with reason `Fetching the missing update actions failed` and reported via #10239.
- The version restore view uses `unwrapOrThrow`, so its behavior is unchanged (react-query handles the error).

### Steps to test:
- Open an annotation that others may edit (or a Concurrent annotation), stop the tracing store / go offline for a minute. Previously, "Root saga crashed" appeared. Now, the console shows retries and WK continues once the server is reachable again.
- Automated: `test/sagas/saving/rebasing_failure_reporting.spec.ts` (retry options are passed; a 403 is reported and doesn't crash) and `test/admin/api_result.spec.ts` (`requestResult` with infinite retries).

### Issues:
- follow-up of debugging a collaborative proofreading report
- contributes to #9552

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0aec3265cfa8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.