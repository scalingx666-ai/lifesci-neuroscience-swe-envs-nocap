# Issue

**Title:** fix: make interrupt acknowledgement a single stable persisted event

## Description

## Summary

- : interrupted conversations no longer lose the stop marker or show duplicate status cards after reload.
- Runtime interrupt emits one `system_message` with stable id `interrupt:{sessionId}:{runId}`.
- Client no longer inserts a local UUID `status` stop row; it only finalizes streaming assistant content and waits for the canonical SSE/history event.
- Hydrate/replay of the same interrupt id yields a single bubble; partial assistant text is preserved.

## Test plan

- [x] `packages/runtime` `interrupt.test.ts` — ack has stable id
- [x] `packages/web` `messageStreamIdempotency.test.ts` — history+SSE fold once
- [x] typecheck / local vitest
- [ ] Manual: Stop mid-stream, reload — one interrupt card, partial output kept

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90ba927e51ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.