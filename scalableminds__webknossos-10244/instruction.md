# Issue

**Title:** Avoid endless requeue loop in version polling while an operation runs

## Description

### Summary
`watchForNewerAnnotationVersion` requeues an `ENSURE_HAS_NEWEST_VERSION` request if it cannot acquire the `REBASE` operation context (because another operation such as `SAVE` in Concurrent mode or `PROOFREADING` is running). The requeue helper then waits via `waitFor(needsPollAnnotationUpdates === "yes")`, which is already true at that point. So the same request was taken again immediately, again and again. The only `await` in this loop is `Mutex.acquire()` (microtasks only), so the loop never yielded to the event loop: timers, rendering and network callbacks were starved and the whole tab froze. Since the blocking operation can't finish without the event loop, the freeze was permanent.

This happens for requests without an operation context, e.g. loading an agglomerate tree in a Concurrent annotation (`skeletontracing_saga.ts`) while a save request is in flight.

Now, the saga waits one second before trying again (100 ms in tests).

Waiting until the other operation is finished (e.g. `behaviorWhenDisallowed: "wait"`) is intentionally not used: the running operation might itself wait for an `ENSURE_HAS_NEWEST_VERSION` request that is queued behind this one (e.g. SAVE asks for the newest version with its own context), which would deadlock.

### Steps to test:
- `yarn test frontend/javascripts/test/sagas/saving/version_poll_saga.spec.ts`: with another operation running, a request without context waits without blocking the event loop and resolves once the operation is finished. Without the fix, the test run hangs (the event loop is starved, so even the test timeout can't fire).
- Manually (optional): in a Concurrent annotation with an agglomerate mapping, start a long operation and load an agglomerate tree at the same time. The tab should stay responsive.

### Issues:
- follow-up of debugging a collaborative proofreading report

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a137e99b89a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.