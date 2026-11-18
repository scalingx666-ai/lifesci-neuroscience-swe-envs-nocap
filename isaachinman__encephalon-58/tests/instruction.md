# Issue

**Title:** [MAR-2559] Preserve Unicode terms in literal FTS queries

## Description

## Summary

Preserve Unicode letter and number terms when Encephalon constructs literal FTS5 queries, while keeping injection safety, operation budgets, public API/CLI shapes, and existing repository/root-installation error semantics unchanged.

## Changes

- add one internal search-text authority for original UTF-8 byte validation, NFC normalisation, Unicode term extraction, literal quoting, and term-budget enforcement
- normalise derived cached search documents to NFC before insertion and exact FTS-text integrity comparison
- bound normalised search documents for the existing twofold projection and NFC's maximum threefold UTF-8 expansion
- compute full, compact, and gather MATCH expressions once before cache work
- retain repository and root-installation validation for zero-term searches while skipping cache and SQLite work
- revalidate constructor-open failures against the verified primary identity
- cover accented Latin, Greek, Cyrillic, Arabic, Hebrew, CJK, combining-mark scripts, hostile FTS syntax, mixed gather searches, packed CLI Unicode search, and empty-search compatibility
- document tokenizer boundaries, compatibility, recovery, and exact implementation provenance

## Compatibility

- public API, CLI syntax, result shapes, operation budgets, cache schema, canonical record bytes, and stable error codes are unchanged
- punctuation-only searches still perform repository/root-installation validation, including `ROOT_INSTALL_REQUIRED`, before returning empty results without cache access
- older derived cache search bytes are detected by existing exact FTS projection validation and rebuilt through the existing bounded recovery path
- SQLite `unicode61` still owns final token boundaries, case folding, diacritic behaviour, BM25 ordering, and snippet construction

## Validation

- `bun install --frozen-lockfile` — no changes
- `bun run lint` — 108 files clean
- `bun run typecheck` — all four TypeScript projects pass
- `bun run test` — 527 passed, 0 failed, 2 established capability skips on Node 26.5.0
- exact minimum-runtime suite — 527 passed, 0 failed, 2 established capability skips on Node 24.15.0
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected existing-version refusal, gate exited 0
- packed Node-only CLI Unicode search passes through the package contract
- diff hygiene and clean-worktree audits pass

## Review

- six parallel security, correctness, data-consistency/race, test-coverage, maintainability, and UX/API reviews completed against `main`
- review identified and fixed empty-search repository/root-installation error compatibility and the search-normalisation separation-of-concerns boundary
- the `ROOT_INSTALL_REQUIRED` compatibility regression has an observed RED against the old fast path and GREEN against the final implementation
- all six final reviewers report no findings on exact head `c3a254d8b5a33714d3a82b888512494cffb6d25d`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63d7a35f3318`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.