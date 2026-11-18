# Issue

**Title:** Fix cancelled sagas continuing after operation context execute()

## Description

### Summary
Fixes the flaky `save_mutex_saga.spec.ts` ("Ad-hoc mutex fetching should not continue after saving of a proofreading action was done").

Root cause: when a saga is cancelled, redux-saga calls `return()` on its generator. If a `finally` block inside a `yield*` delegation yields an effect, the delegating generator resumes *normally* afterwards instead of continuing to return. `execute()` of operation contexts does `yield put(unregister...)` in a `finally`, so a save-queue draining saga that was cancelled mid-save (e.g., by a saga restart) kept running as a zombie `while (true)` loop. In tests, the zombie and the new drainer both reacted to the same `SAVE_NOW`, registered a `SAVE` child under `PROOFREADING` twice, the reducer threw, and the root saga crashed. This only happens if the restart lands mid-save, hence the flakiness under load.

Fix: `execute()` (top-level and borrowed contexts) runs the body and its cleanup in a `call`ed child task (`runWithCleanup`). The generator that callers delegate to then only contains a plain yield and terminates on cancel, while the cleanup still runs.

### Steps to test:
- `yarn test frontend/javascripts/test/sagas` (new regression test in `operation_context_saga.spec.ts` fails without the fix)
- Flakiness repro: run `save_mutex_saga.spec.ts` ~14x in parallel; ~3/14 failed before, 0/14 after.

### Issues:
- none

------
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cef3027433b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.