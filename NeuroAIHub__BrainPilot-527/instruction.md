# Issue

**Title:** fix(runtime): keep internal reminders out of Stop recovery

## Description

## Summary

.

- clears Pi steering/follow-up queues before and after abort settlement, covering the `agent_end` reminder race
- prevents an internal Trace/workflow reminder queued before Stop from consuming the next explicit user prompt
- buffers split `<!--NO-RENDER-->...<!--/NO-RENDER-->` stream chunks without ever rendering them
- removes the completed internal-only message at TEXT_MESSAGE_END
- drops atomic NO-RENDER chat chunks and keeps old persisted histories clean on rehydrate

## Verification

- Runtime targeted: `event-mapping.test.ts` + `interrupt-cancel.test.ts` — 22 passed
- Web targeted: `demoTruncatedExport.test.ts` + `messageStreamIdempotency.test.ts` + `internalToolStrip.test.ts` — 30 passed
- Runtime full: 65 files / 657 tests passed
- Web full: 80 files / 648 tests passed
- Runtime and Web production builds passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bff5a8709ada`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.