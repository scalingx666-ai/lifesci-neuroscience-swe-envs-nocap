# Issue

**Title:** [MAR-2549] Bound untrusted SQLite cache validation

## Description

## Summary

- bound every untrusted SQLite cache read before text or row materialisation
- validate schema, metadata, records, FTS data, freshness, and the requested read within one verified transaction
- recover disposable corruption by quarantining one exact identity captured after verified open, rebuilding once, and retrying once

## Changes

- add a dependency-free canonical budget authority for 1,000 records, 1 MiB per record, and 8 MiB aggregate canonical JSON
- replace unbounded schema, metadata, record, and FTS reads with numeric-only probes over bounded inner queries followed by bounded iteration
- enforce storage classes, canonical `recordsIndexed` syntax, per-value byte limits, aggregate byte limits, and record/FTS relationships before materialisation
- normalise malformed cached JSON without retaining parser causes that may contain untrusted source excerpts
- coordinate recovery across prepare, hydrate, read APIs, forced gather hydration, post-commit add hydration, and init preparation, including callers that already hold the operation lock
- distinguish an absent observed primary from a distinct successor so recovery rebuilds only the former and preserves/retries the latter
- retain an exclusively claimed primary's exact identity across repository-change retries, preserving any replacement without writer initialisation
- route malformed metadata from forced and already-held writer paths through exact quarantine instead of overwriting it in place
- admit schema-valid FTS search documents with conservative derived bounds of twice the cached-record limits
- preserve the verified writer identity for recoverable metadata, transaction, and write failures
- treat exclusive claims as owned immediately and route every witnessed pre-verification disappearance through bounded missing-primary recovery
- preserve terminal foreign-cache, repository-change, contention, operational-I/O, and unknown failure classifications
- update maintained documentation and exact implementation provenance

## Compatibility

- public API signatures, input/result shapes, and package exports are unchanged
- canonical JSON remains authoritative; the SQLite cache remains disposable
- semantic schema validation remains assigned to MAR-2553 and FTS text equality to MAR-2550
- exact limits remain inclusive, including 1,000 rows and 12,484,608 aggregate cached-record JSON bytes

## Validation

- 480 tests passed with 2 established filesystem-capability skips and 0 failures
- lint passed across 103 files
- all four TypeScript projects passed
- baseline and CI-budget benchmarks passed
- build, packed-package, publish-contract, and frozen-install gates passed
- focused final review regressions passed 5/5 plus a complementary post-construction disappearance case; affected suites passed 406 tests with the same 2 established skips

## Review

- completed task-level reviews, a whole-branch review, and all three permitted six-role branch-review waves
- addressed malformed-JSON and metadata privacy, lock-held hydration recovery, missing-primary generation handling, immediate and retained claimed-primary identity, forced-writer quarantine, recoverable writer failure identity, valid FTS bounds, and exact-boundary public acceptance coverage
- completed a final separation-of-concerns, dead-code, assumption, package, Bun-lock, declaration, and documentation audit
- no unresolved high- or medium-confidence concern remains

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bb6f9f8aa25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.