# Issue

**Title:** fix(runtime): stop without a follow-up model run to acknowledge interrupt

## Description

## Summary

- : whole-session Stop no longer launches a principal/provider run just to acknowledge the interruption.
- After aborts settle: clear mailboxes, emit one deterministic `system_message`, set `runActive` false, `emitSessionState` — no `agent.prompt(interrupt notice)`.
- Updates `#90` / `#101` tests to assert zero follow-up prompts, settled `runState.active`, and no RUN_ERROR race.

## Test plan

- [x] `interrupt.test.ts` + `interrupt-cancel.test.ts` (5 tests)
- [ ] Manual: Stop mid-stream — Stop clears promptly, one system ack, no extra assistant acknowledgements, partial output kept

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea166f74eab4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.