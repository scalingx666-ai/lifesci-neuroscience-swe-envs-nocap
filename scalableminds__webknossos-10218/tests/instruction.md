# Issue

**Title:** Report operations that block the UI for more than 20 seconds

## Description

### Summary
While an operation (e.g. `PROOFREADING`, `SAVE`, `REBASE`) is registered in the operation context, the viewports are blocked (`isUserInterfaceBlocked`). If a saga inside such an operation never returns, e.g. because it waits for a request or a sync that never completes, the user only sees a wait cursor and nothing is logged. This made a report of a "frozen" viewer (with a still working sidebar) hard to analyze.

A new `watchForLongRunningOperations` saga (started in the root saga) watches each `REGISTER_OPERATION`. If the same operation is not unregistered within 20 seconds, it
- logs a `console.warn` including the active and child operations and
- notifies Airbrake once (severity `warning`; message `Operation "<ID>" has been running for more than 20 seconds.`, params: operation id, description, active and child operations).

When the operation eventually finishes, this is logged, too. That way, a slow operation can be told apart from a stuck one. Long-running but legitimate operations (e.g. a large floodfill) are also reported once; the report is only a warning and not escalated.

### Steps to test:
- `yarn test frontend/javascripts/test/sagas/operation_context_saga.spec.ts` (new tests with a short threshold).
- Manually: temporarily lower `LONG_RUNNING_OPERATION_THRESHOLD_MS`, start a proofreading action or floodfill and check the console warning.

### Issues:
- found while debugging a collaborative proofreading report ("froze up completely")

------
- [ ] Added changelog entry (not needed, no user-facing change)
- [x] Removed dev-only changes like prints and application.conf edits
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a30fb09f1a64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.