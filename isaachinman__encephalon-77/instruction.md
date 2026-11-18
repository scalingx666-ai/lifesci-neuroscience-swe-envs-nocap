# Issue

**Title:** [MAR-2637] Bound concurrent recovery-marker reclaim

## Description

## Human summary

Fixes the Windows-only recovery-marker race that failed main after PR #73 merged. Concurrent reclaim losers now re-observe safely instead of surfacing an expected sharing or identity collision as a terminal error.

## Summary

- retries pre-move EACCES, EBUSY, and EPERM failures within the existing three-attempt bound only while the exact recovered marker remains current and stale
- treats another contender moving the captured marker as a completed lost race and returns to fresh observation
- preserves fail-closed exact owner, witness, identity, token, phase, and byte validation, including terminal post-move failures
- stops recovery-marker retries at the existing total operation-lock deadline
- adds deterministic coverage for transient and persistent sharing violations, changed recovery evidence, deadline exhaustion, and a concurrent reclaim winner

## Testing

- node ./scripts/check-generated-version.ts
- bun install --frozen-lockfile
- bun run typecheck
- bun run lint
- bun run test — 672 total, 669 passed, 3 established capability skips
- bun run benchmark:check
- bun run build
- node ./scripts/check-package.ts with an isolated npm cache
- node ./scripts/check-publish.ts with the expected already-published 0.2.0 refusal
- node ./dist/cli.mjs validate --root . — 38 records valid

## Review evidence

- two complete six-role local review rounds using Luna
- all valid round-1 findings addressed
- round 2 found no valid P0–P3 issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13162f55ccf5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.