# Issue

**Title:** Stop requesting saves for finished operation contexts

## Description

### Summary
A frontend test failed in CI (`save_mutex_saga.spec.ts`, "Ad-hoc mutex fetching should not continue after saving of a proofreading action was done") because the root saga crashed with `Child operation "SAVE" is already registered under parent "PROOFREADING"`.

Analysis:
- `Model.ensureSavedState(ctx)` is a plain async loop that dispatches `SAVE_NOW` with its operation context until everything is saved. Restarting the sagas (as done between tests) cancels the operation, but not this loop.
- With logging, a loop started in one test was shown to dispatch `SAVE_NOW` with its (stale) `PROOFREADING` context two tests later.
- The save saga borrows from the context of a `SAVE_NOW` action, so it registered a `SAVE` child under a parent that didn't exist anymore.
- The exact interleaving that leads to the duplicate registration could not be reproduced locally (~100 runs, incl. random delays and heavy CPU load), so this PR removes the stale requests and makes future occurrences easier to analyze.

Changes:
- `OperationContext.isActive()`: false once `execute()` finished (also when the saga was cancelled). Borrowed contexts additionally require an active parent.
- `Model.ensureSavedState` stops once its operation context is not active anymore (calls without context are unchanged).
- `getOrCreateOperationContext` throws if the passed context is already finished (borrowing from it would register a child operation under a parent that doesn't exist anymore, which indicates a bug).
- The errors about duplicate (child) operations include the currently active and child operations.

In production, this mostly affects tests (saga restarts), but it also prevents saving on behalf of an operation that was already cancelled.

### Steps to test:
- New tests in `operation_context_saga.spec.ts` (`isActive`, throwing for a finished context) and `pushSaveQueueAsync.spec.ts` (`ensureSavedState` with a finished context doesn't dispatch `SAVE_NOW`; fails without the fix).
- `yarn test` passes.

### Issues:
- flaky test from CI run 39792813397

------
- [ ] Added changelog entry (not needed, no user-facing change)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6807c7c1c97a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.