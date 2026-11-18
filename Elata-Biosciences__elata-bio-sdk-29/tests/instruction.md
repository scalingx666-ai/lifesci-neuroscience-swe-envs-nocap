# Issue

**Title:** docs(rppg-web): deprecate DisplayBpmTracker.hold()

## Description

## Summary

. `DisplayBpmTracker.hold()` keeps a display value alive on a cycle the caller has already deemed untrustworthy, which is the exact holdover pattern `resolveDisplayMetrics` (#26) exists to make structurally impossible, and the root cause diagnosed in neural-chat-app#10 / #24.

No current consumer uses `DisplayBpmTracker` (checked across peak-app, vitality-app, neural-chat-app). Rather than remove a public export outright, this documents the contradiction on the class and on `hold()` specifically, pointing at `resolveDisplayMetrics` for any production display-trust decision.

## Change

Doc comments only. No behavior change, no test changes needed.

## Test plan

- 419/419 package tests passing (unchanged)
- `tsc --noEmit` clean
- `biome lint src` clean
- `pnpm run build` clean
- Changeset added (patch)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecf5279070d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.