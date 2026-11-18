# Issue

**Title:** feat(rppg-web): add resolveDisplayMetrics, the single display-trust decision

## Description

## Summary

A candidate fix for #24. Three independent consumer apps (peak-app, vitality-app, neural-chat-app) each wrote their own version of "is this reading trustworthy enough to show," and at least two got it wrong the same way: a UI checked `bpm != null` with no confidence gate (#24, neural-chat-app#10, peak-app#404/#408).

Root-caused neural-chat-app#10 down to the actual mechanism while looking into this: `RppgGatingController` (`rppgGating.ts`) already nulls `publishBpm` the instant a reading stops being trustworthy that part of the SDK was already correct. The bug was that the app then layered its own median/EMA smoothing on top of the already-gated `publishBpm`, and that accumulator only updated on a fresh sample so once the SDK correctly went to `null`, the app's own smoothing silently held its last value forever, with no expiry. The SDK's gating was right; the app's re-smoothing on top of it defeated it.

## Fix

`resolveDisplayMetrics(snapshot)` one pure, **stateless** function that's the single place "should this BPM/HRV be shown right now" gets decided. Deliberately has no accumulator: a pure snapshot-in, decision-out mapping, so there's nothing for a caller to accidentally hold past the point `canPublish` goes false. Returns `bpm`/`hrvRmssd` as `null` whenever `canPublish` is false, plus a `confidence: 'low'|'high'` bucket apps can use for a caption or their own internal math (e.g. confidence-weighted averaging) without it gating the number `canPublish`/`publishBpm` already encode the SDK's fuller trust decision (face presence, framing, motion, signal quality), and re-deriving that from `confidence` alone in each app is the same class of bug again.

Addresses #24's first "possible direction" (a single required gate) plus the stronger one (the SDK not emitting an untrustworthy value) apps replace their own smoothing/gating logic with one call to this.

## Test plan

- `tsc -p . --noEmit` - clean
- `biome lint src` - clean
- `pnpm run build` - dist compiles and Node-ESM-verifies cleanly
- Full package test suite: 358/358 passing (44 suites)
- 7 new tests, including one that directly reproduces the exact bug shape from neural-chat-app#10 (`canPublish: false` with a stale `publishBpm` still sitting on the snapshot) and confirms it nulls correctly
- Verified by construction that the fix has no holdover: two calls in a row with different snapshots reflect each independently - there's no accumulator to defeat, which is the property that makes the original bug structurally impossible here

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc6d4372c27d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.