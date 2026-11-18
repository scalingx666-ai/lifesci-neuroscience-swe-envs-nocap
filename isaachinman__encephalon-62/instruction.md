# Issue

**Title:** [MAR-2560] Deduplicate repeated gather database work

## Description

## Human summary

Repeated IDs and searches in one gather request now reuse verified database results without changing output order, response limits, error behaviour, or the independence of returned values.

## Summary

- memoises each exact show ID and original search query inside one accepted gather cache snapshot
- includes missing IDs and zero-term search results while keeping textually different queries distinct
- preserves shows-before-searches ordering, every duplicate output occurrence, per-occurrence response charging, and independent mutable results
- creates memo state inside the snapshot reader so discarded cache generations and recovery retries cannot share partial results
- derives the dense gather benchmark workload from the central operation-budget authority and covers both empty and populated corpora
- updates maintained contract, performance evidence, changelog, design, plan, and exact reviewed provenance

### Backwards compatibility

This is fully backwards compatible. Public API and CLI shapes, input limits, response budgets, ranking, snippets, active filtering, error codes, cache schema, canonical records, recovery policy, package exports, and production benchmark timeout remain unchanged.

### Review

- six final exact-head reviewers returned `SHIP`
- security, correctness, race/data consistency, test coverage, maintainability, and UX/API compatibility reported no P0-P3 findings
- the initial test review found missing positive-corpus benchmark coverage; the final head asserts the expected active chain ID and gather workload wiring

### Verification

- `bun install --frozen-lockfile` — no changes
- `bun run lint` — 116 files
- `bun run typecheck` — all four TypeScript projects
- `bun run test` — 555 tests, 553 passed, 2 intentional skips
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected refusal for already-published version `0.2.0`
- `node dist/cli.mjs validate` — 38 records checked, 0 errors
- `git diff --check origin/main...HEAD`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7f92a798a04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.