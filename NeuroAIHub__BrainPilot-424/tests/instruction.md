# Issue

**Title:** feat(web): add neuroscience dataset marketplace

## Description

## Summary
- add a Datasets tab to the existing plugin marketplace
- render searchable dataset cards with access class, modality, license, provider, size, and detail views
- support one-click download launch, credential forms, progress polling, target paths, and provider links
- expose fixed download commands and avoid showing a download action when no automated recipe exists

## Dependency
Runtime download actions depend on #423. This PR is intentionally frontend-only so the UI can be reviewed independently.

## Validation
- `npm run build -w @brainpilot/web`
- `npm test -w @brainpilot/web -- --run src/__tests__/pluginMarketplace.test.ts src/__tests__/api.test.ts` (54 tests)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e80e0301a8af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.