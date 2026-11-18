# Issue

**Title:** fix(rppg-web): add shouldDeclareNoFrame, the correct zero-frames-ever check

## Description

## Summary

`pastStartupGrace` alone gates the zero-frames-ever check on elapsed time only, but `startedAt` never moves once a real frame lands, so `pastStartupGrace` stays true for the rest of the session once the grace period clears. A single missed `readyState`/`videoWidth` tick anytime after that, even deep into an otherwise-healthy reading, was indistinguishable from a camera that never started at all, and this module's own doc comment previously pointed a zero-frame caller at `pastStartupGrace` directly for exactly this check.

Found independently in both consumer forks of this module (`peak-app`, `vitality-app`) before either had migrated onto this package both hit the same bug in their own duplicated copy of `cameraLiveness.ts` and fixed it the same way, which is what surfaced that the underlying issue traces back to this package's own (unexported) implementation of the pattern.

## The fix

Adds `shouldDeclareNoFrame(liveness, nowMs)`, gated on `liveness.signature` also still being `null` (no frame has EVER been sampled this session) in addition to the elapsed-time check the one condition that actually holds for "never started" and not for "started fine, one bad tick." Exported from the package, and `pastStartupGrace`'s own doc comment updated to point zero-frame callers at the new function instead.

## Why this belongs here rather than in each app

Both `peak-app` and `vitality-app` are migrating their camera-liveness detection onto this package instead of maintaining their own forked copies (tracking: `peak-app#405`). Landing the fix here first means neither app (nor a future consumer) inherits the bug a third time.

## Test plan

- [x] New unit tests (`shouldDeclareNoFrame`) that fail without the signature check and pass with it, verified by reverting the fix and watching the regression test go red, then restoring it
- [x] `pnpm test` in `packages/rppg-web` - 16/16 passing
- [x] `pnpm build` in `packages/rppg-web` - clean
- [x] `biome check` - clean (also reformatted `cameraLiveness.ts`, which had drifted to 2-space indentation from its origin as a copied-in module; no logic change)
- [x] Changeset added (minor bump, new export)

## Downstream

`peak-app` and `vitality-app` both have migration branches ready (deleting their local `cameraLiveness.ts` forks in favor of importing from this package) that depend on this landing and publishing. Not pushed yet but waiting on this PR.

cc @Cartev112  - you own this module's history (`elata-bio-sdk#28`) and there are several other pending changesets queued in `.changeset/`, so the release timing/bundling is your call, not something I want to trigger unilaterally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b266b1d3f17d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.