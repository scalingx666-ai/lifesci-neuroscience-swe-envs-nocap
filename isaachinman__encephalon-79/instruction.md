# Issue

**Title:** [MAR-2666] Replan add against stable canonical generations

## Description

## Summary

- replan `addRecord()` against one stable canonical generation with a shared retry/deadline ledger
- verify the final pre-link generation and prove the exact prior-generation-plus-one-record delta after publication
- preserve existing successful API/JSON shapes and committed-error wording while adding bounded repository-change details
- retain canonical and artifact evidence through cache hydration so unrelated mutation cannot be reported as clean success
- document the add-specific behaviour without changing init semantics

## Verification

- `bun run test` — 780 tests, 777 passed, 3 platform skips, 0 failed
- `bun run typecheck`
- `bun run lint`
- `bun run benchmark:check`
- `bun run build`
- `node ./scripts/check-generated-version.ts`
- `node ./scripts/check-package.ts`
- `node ./scripts/check-publish.ts`
- `git diff --check`

## Review

- completed two local six-reviewer rounds covering security, correctness, data consistency/races, tests, maintainability, and UX/API compatibility
- no valid P0–P3 findings remain

Linear: [MAR-2666](https://linear.app/marcoappio/issue/MAR-2666/canonical-records-replan-add-against-a-stable-generation-and-verify)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa557e4a6f3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.