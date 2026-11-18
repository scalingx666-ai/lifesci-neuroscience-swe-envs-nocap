# Issue

**Title:** fix(web): make stream content merge idempotent on restore

## Description

## Summary

- : restoring a conversation could concatenate the same assistant (and continuation) content twice inside one message bubble.
- Root cause: history rehydrate folds `events.jsonl` through `reduceMessagesForEvent`, then the SSE ring buffer replays the same recent events. `TEXT_MESSAGE_START` was already idempotent by `messageId`, but `TEXT_MESSAGE_CONTENT` always did `content + delta`.
- Fix: stream-append events (`TEXT_MESSAGE_CONTENT`, `REASONING_MESSAGE_CONTENT`, `TOOL_CALL_ARGS`) ignore further appends once a message is finalized (`streaming: false`), and dedupe in-flight appends via stable event identity (`_ts` + type + id + delta). Distinct events with the same text (intentional model repeats) still apply.

## Acceptance criteria

- [x] Automated test reproduces the historical-message duplication path (`messageStreamIdempotency.test.ts`)
- [x] Boundary identified: frontend streaming reconciliation / message merge (not persistence or render)
- [x] Refresh / re-attach / replay no longer re-append the same CONTENT deltas
- [x] Stable event identity + finalized-message guard for continuation and regular assistant streams
- [x] No destructive string-halving or generic text dedupe of intentional repeats

## Test plan

- [x] `packages/web` unit tests (`npm test`) — 256 passed, including new #314 cases
- [ ] CI green on this PR
- [ ] Manual: open a session that previously showed doubled assistant text after restore; confirm single content after refresh / session switch

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bada0580594e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.