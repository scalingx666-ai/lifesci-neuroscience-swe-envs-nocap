# Issue

**Title:** fix(ux): replace Trace internals with user-facing language

## Description

## Summary

.

Keeps the complete Agent/Trace workbench and all rollback semantics, while replacing default implementation vocabulary with user-facing task/file language:

- `因果回退` → `撤销此步骤及后续更改`
- localizes confidence/review/origin/session-start enum values
- replaces untranslated Review/Reason/Context/Candidate dependencies/Accept/Reject/Episode headings and actions
- localizes relation and artifact labels in live Trace and Live Demo
- removes raw confidence from graph node cards and uses a localized revoked label
- simplifies restore confirmation copy without changing APIs or destructive-operation confirmation

This deliberately does **not** reintroduce #488's rejected additional disclosure layer.

## Verification

- `npm test -w @brainpilot/web -- traceV2Detail.test.tsx traceCheckpointDetail.test.tsx traceGraphEmptyMarkup.test.tsx` — 10 passed
- `npm test -w @brainpilot/web` — 80 files / 647 tests passed
- `npm run build -w @brainpilot/protocol -w @brainpilot/plugin-sdk`
- `npm run build -w @brainpilot/web` — production build passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7be504a7566`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.