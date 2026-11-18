# Issue

**Title:** feat(datasets): add public dataset download backend

## Description

## Summary
- add a curated neuroscience dataset catalogue and local-only download API
- support resumable HTTP downloads, fixed provider CLI recipes, progress reporting, and credential-safe command execution
- add isolated job tracking, backend tests, and a lightweight real-provider smoke test

## Public sources covered
- OpenNeuro ds000030 / ds000114
- DANDI 000026
- PhysioNet EEG Motor Movement/Imagery
- BCI Competition IV 2a

The catalogue also records application-gated sources as informational entries without bypassing provider approval.

## Validation
- `npm run typecheck -w @brainpilot/backend-core`
- `npx vitest run packages/backend-core/test/datasets.test.ts packages/backend-core/test/plugins.test.ts` (13 tests)
- `npm run test:datasets` (PhysioNet tiny file, BCI HEAD/Range metadata, OpenNeuro git HEAD, DANDI metadata)

A follow-up frontend PR will consume these endpoints.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e3c174db7c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.