# Issue

**Title:** [MAR-2639] Build baselines from one stable repository observation

## Description

## Summary

- retain compact witnesses for every baseline source that contributes package, top-level, language, or workflow facts
- revalidate the complete assembled baseline observation and retry changed generations within one three-attempt, 60-second ledger
- preserve stable expected truncation reasons while propagating hook and internal failures unchanged
- retain only compact package evidence after parsing and document the retry contract

## Backwards compatibility

- preserves stable baseline record shapes, ordering, payload bytes, and ordinary `init` output
- preserves existing truncation reason strings for stable expected failures
- uses the existing path-free `REPOSITORY_CHANGED` error for persistent churn

## Verification

- `bun install --frozen-lockfile`
- `node ./scripts/check-generated-version.ts`
- `bun run typecheck`
- `bun run test` — 812 tests, 809 passed, 3 platform skips
- `bun run lint`
- `bun run benchmark:check`
- `bun run build`
- `node ./scripts/check-package.ts`
- `node ./scripts/check-publish.ts`
- `git diff --exit-code HEAD`

## Review

- completed two local six-role Luna review rounds covering security, correctness, data consistency/races, tests, maintainability, and UX/API compatibility
- addressed every valid finding from both rounds
- exact head under review: `b221d9fd5c827f56738e2d3e7135bb6dfea73865`

## Linear

- MAR-2639

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `843a900f0c92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.