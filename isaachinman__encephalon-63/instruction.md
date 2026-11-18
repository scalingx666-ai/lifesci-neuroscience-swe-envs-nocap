# Issue

**Title:** [MAR-2565] Reuse validated mutation snapshots

## Description

## Human summary

Adds and initialises records faster by safely reusing the exact data already validated for publication. If anything changes, Encephalon falls back to its established disk rebuild without changing results or errors.

## Summary

- rebuilds disposable cache state from the strictly validated, publication-bound add or init snapshot
- shares one transactional cache writer between mutation snapshots and ordinary disk rebuilds
- binds snapshot acceptance to canonical authority, artifact identities, repository realpath, and complete manifests before and during the transaction
- discards uncertain snapshots once and uses the existing bounded disk rebuild without mixing generations
- preserves create-claim `REPOSITORY_CHANGED` precedence and details across the shared writer integration
- preserves public results, error codes, messages, details, progress, recovery actions, canonical JSON, cache schema, package exports, and operation budgets
- documents diagnostic 100- and 1,000-record improvements and the exact reviewed implementation provenance

## Backwards compatibility

Backwards compatibility is a release invariant. Existing valid repositories, records, instruction files, caches, clients, public inputs and outputs, error framing, persisted formats, and deterministic recovery behaviour remain supported without migration or data loss. Snapshot reuse is disabled whenever actual bytes or identity evidence cannot preserve those guarantees.

## Verification

- `bun install --frozen-lockfile` — no changes
- `bun run lint` — 116 files clean
- `bun run typecheck` — all four TypeScript configurations clean
- `bun run test` — 561 passed, 2 established capability skips
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected refusal for already-published 0.2.0, gate exit 0
- `node dist/cli.mjs validate --root /Users/isaac/Code/open-source/encephalon` — 38 records, 0 errors
- six-role final exact-head review — SHIP with no P0-P3 findings

## Review evidence

The rebased integration suite exposed a create-if-missing error-precedence regression. The shared writer now retains the established `REPOSITORY_CHANGED` code and stable-identity details for ordinary and mutation-snapshot rebuilds; both focused regressions and the full suite pass.

Final exact-head security, correctness, data/race, test-coverage, maintainability, and UX/API reviews returned SHIP with no findings. The branch contains only the 14 MAR-2565 implementation, documentation, and test files on the current green `main` base.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9864a8087ec3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.