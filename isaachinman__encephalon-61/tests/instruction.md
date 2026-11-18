# Issue

**Title:** [MAR-2552] Validate each cache generation once per read

## Description

## Human summary

Cache-backed reads now validate each cache generation once and return data from that same verified snapshot, reducing repeated work while preserving recovery, errors, and existing public behaviour.

## Summary

- validate one cache generation once per successful cache-reading operation and materialise the result from the same verified SQLite transaction
- share cache preparation and public reads through one private resolver while preserving punctuation-only no-cache behaviour
- bind post-rebuild reads to the rebuilt database's exact identity, preserve concurrent successors, and retain existing error categories
- apply the same single-pass and recovery guarantees to forced gather hydration
- enforce the exact-one validation boundary in isolated benchmark workers
- document the cache-read contract, performance evidence, recovery ceilings, and immutable implementation provenance

## Backwards compatibility

- public inputs, outputs, exports, generated declarations, canonical record format, and SQLite schema are unchanged
- existing `IO_ERROR`, `REPOSITORY_CHANGED`, and other public error classifications are preserved
- cache recovery remains bounded and deterministic

## Verification

- `bun run lint`
- `bun run typecheck`
- `bun run test` — 552 tests, 550 passed, 2 established capability skips, 0 failed
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected refusal for already-published `0.2.0`, gate exited 0
- `bun install --frozen-lockfile` — no changes
- `node dist/cli.mjs validate` — 38 records checked, 0 errors
- `git diff --check origin/main...HEAD`

## Review evidence

- final exact-head security review: SHIP, no P0–P3 findings
- final exact-head correctness/bug review: SHIP, no P0–P3 findings
- final exact-head data consistency/race-condition review: SHIP, no P0–P3 findings
- final exact-head test coverage review: SHIP, no P0–P3 findings
- final exact-head maintainability review: SHIP, no P0–P3 findings
- final exact-head UX/API regression review: SHIP, no P0–P3 findings

Focused tests cover exact-one validation, post-rebuild canonical changes, and stale-successor preservation for both automatic reads and forced gather hydration. Mutation checks demonstrate that removing either identity binding or the single-pass boundary makes these tests fail.

## Stack

- based directly on `main` after #60
- Linear: MAR-2552

## Checklist

- [x] Tests cover the behaviour and race fixes
- [x] Documentation matches the current implementation
- [x] Public declarations and package surface are unchanged
- [x] No lockfile, package, Bun, or TypeScript configuration drift

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bde5239b61c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.