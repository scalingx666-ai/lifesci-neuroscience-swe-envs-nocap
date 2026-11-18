# Issue

**Title:** fix: close stream, provider, and sandbox release blockers

## Description

## Summary

- add a persisted `_event_id` to runtime events and use it for stream replay deduplication, preserving identical text, reasoning, and tool-argument deltas emitted in the same millisecond
- resolve `apiKeyEnv` (including `.env` fallback) when testing an Environment provider profile, and report a clear missing-variable error without sending an empty credential
- install and assert `ripgrep` and `file` in CPU/GPU sandbox images

## Validation

- `npm run typecheck`
- `BP_MOCK=1 npm test` — 92 files, 1018 tests
- `npm --workspace @brainpilot/web test` — 63 files, 506 tests
- `npm --workspace @brainpilot/web run build`
- `npm run version:check`
- `npm pack --workspaces --if-present --dry-run`
- built the `python-baseline` Docker target and smoke-tested `git`, `rg`, and `file` inside the image

## Remaining release gate

`npm publish --dry-run` correctly refuses to republish the existing `0.1.2`. The version bump/tag/publish work remains tracked in #462; this PR intentionally does not change package versions or publish artifacts.

Related: #462

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20d3b7e00577`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.