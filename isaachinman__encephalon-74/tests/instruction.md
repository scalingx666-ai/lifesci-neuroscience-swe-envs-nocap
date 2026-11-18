# Issue

**Title:** [MAR-2636] Bound and reclaim lock candidates

## Description

## Human summary

Operation locking now stays bounded in large cache directories and safely clears abandoned temporary lock candidates without changing public APIs, errors, deadlines, or fixed-lock recovery behaviour. The Windows-specific recovery races found by the exact-head matrix are covered directly.

## Summary

- stream at most 64 cache-directory entries, inspect at most 16 canonical candidates, and attempt at most 4 reclamations per operation
- retain at most 8 identity-bound process-local cursors for bounded forward progress, while closing native Windows readers after every pass so directory handles cannot block repository cleanup
- reclaim only unchanged ownerless, malformed, or positively dead candidates under the held SQLite gate; preserve oversized, linked, live, ambiguous, or changed evidence
- distinguish a completed rename from a verified captured-directory move so recovery suppresses only the pre-verification identity race and preserves all other cleanup errors
- reassert fixed-lock authority after quarantine verification and before destructive candidate cleanup
- keep reentrant replacement cursors map-owned when a stale reader closes
- bind promotion, maintenance, quarantine, and cleanup to exact directory, child, owner, recovery-witness, metadata, and raw-byte evidence
- redact private candidate UUIDs from public errors and exported filesystem cause chains
- align the README, changelog, maintained contract, implementation plan, design, and review plan with the final behaviour

## Backwards compatibility

- no public API, exported type, cache schema, stored format, or callback-result changes
- existing error codes, error details, and precedence remain authoritative
- the existing single acquisition deadline and fixed recovery-marker semantics are preserved
- platform-specific cursor disposal changes only private best-effort maintenance progress on Windows

## Testing

- `bun install --frozen-lockfile`
- `node ./scripts/check-generated-version.ts`
- `bun run typecheck`
- `bun run lint`
- `bun run test` with an isolated npm cache — 707 tests, 704 passed, 0 failed, 3 platform skips
- current Node and Node 24.15.0 focused recovery-race, cursor-lifetime, reentrancy, and authority tests — 7 passed, 0 failed on each runtime
- `bun run benchmark:check`
- `bun run build`
- `node ./scripts/check-package.ts` with an isolated npm cache
- `node ./scripts/check-publish.ts` — expected already-published guard for 0.2.0
- clean committed-head diff and generated-source verification

## Review evidence

- fresh local round 1: six parallel Luna role reviews; one valid high-confidence P2 test-order finding fixed
- fresh local round 2: six parallel Luna role reviews; one valid P1 and two valid P2 findings fixed
- post-review full suite and every release-equivalent local gate pass
- exact-head GitHub CI and exact-head Pullfrog review must both pass again before merge

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0023f5c08cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.