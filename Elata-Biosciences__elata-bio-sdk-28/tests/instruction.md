# Issue

**Title:** feat(rppg-web): add the reliability-gating surface

## Description

## Summary

Part 1 of # (revised): instead of a new `@elata-biosciences/rppg-core` package (the original scoping comment's proposal, superseded every consumer of this logic already depends on `rppg-web` for the camera/WASM pipeline, so a separate package would only add a second thing to keep version-compatible, without saving any consumer a dependency), this folds the reliability-gating logic in as more exports on the existing, already-depended-on `@elata-biosciences/rppg-web`. Same pattern as #26.

Three independent consumer apps (peak-app, vitality-app, neural-chat-app) each hand-copied and independently re-drifted this exact logic - /#26/#.

## What moved (each with its existing test)

- `trustedHrvSample` / `HRV_TRUST_QUALITY_MIN` (`hrvSampleTrust.ts`)
- `captureProgress` / `trustFloorAt` / `restartDetected` / `TRUST_FLOOR` and its easing constants (`captureProgress.ts`) `TRUST_FLOOR` itself pulled out of peak-app's much larger `metrics.ts`, since it belongs beside its only real consumer
- `initialLiveness` / `observeFrame` / frozen-frame detection (`cameraLiveness.ts`)
- `landmarkMotion`, the #404 motion gate (`motionIndex.ts`) now typed against the SDK's own `LandmarkLike` instead of a peak-app-local type
- `fitExposureResponse`, split out of a larger `cameraTuning.ts` whose other half (`zoomFor`/`tuningFor`/`shouldRetune`) is camera-request orchestration specific to how each app talks to its own capture session, and stays local to each app

## Deliberately narrowed on one file

`calibration.ts`'s `CALIBRATION_LABEL`, `calibrationLabelTone`, and `signalTier`'s tone field are display copy and CSS tone classes, not logic only `calibrationStage()` (the actual state machine) moves. Peak's work-framing and Vitality's recovery-framing genuinely differ and were never meant to be forced into one shared surface; only the drift-prone ORDERING logic was.

## Not in this PR

- Peak-app/vitality-app migrating to consume this (separate follow-up PRs per app, once this is reviewed and published)
- #27 (found while researching this: `DisplayBpmTracker.hold()` already in this package contradicts the no-holdover design here - filed separately, zero current consumers, not blocking this PR)

## Test plan

- `tsc -p . --noEmit` - clean
- `biome lint src` - clean
- `pnpm run build` - dist compiles and Node-ESM-verifies cleanly
- Full package suite: 408/408 passing (49 suites), including 58 new tests across the 6 moved modules
- App-specific source-scan tests (checking how peak-app's own `App.tsx`/`PulseContext.tsx`/`BaselineCapture.tsx` consume these functions) did not port - the SDK has no such files; only behavioral tests moved
- Changeset added (`@elata-biosciences/rppg-web`, minor)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49fdb41d0593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.