# Issue

**Title:** [MAR-2554] Bound compact and gather responses

## Description

## Summary

- bound standalone compact-search responses to one deterministic 4 MiB logical-byte budget
- bound complete gather responses, including metadata, envelopes, shown records, compact results, nulls, and duplicates, to one shared 4 MiB budget
- stop compact SQLite materialisation at the first over-budget validated row

## Changes

- add internal `compactResponseBytes` and `gatherResponseBytes` authorities alongside the existing full-response budget
- centralise order-independent logical response accounting for UTF-8 strings, object keys, and fixed-cost semantic nodes
- reuse the same ledger abstraction for existing full-record raw-byte charging without changing list, show, or full-search behaviour
- replace compact `.all()` materialisation with transactional `.iterate()` consumption
- allocate response ledgers per verified read attempt so cache-recovery retries start cleanly
- charge repeated shows and searches on every occurrence without truncation or deduplication
- document exact boundaries, stable errors, ownership, and reviewed provenance

## Compatibility

- public APIs, result shapes, ranking, ordering, cache schema, package exports, CLI options, and existing full-record limits are unchanged
- budget failures remain `INVALID_ARGUMENT` with bounded `{ field, budget, maximum }` details
- exact-budget responses succeed; over-budget responses fail without returning a partial result

## Validation

- rebased as an eight-commit MAR-2554-only delta on current `main`
- 521 tests: 519 passed, 0 failed, 2 established filesystem-capability skips on Node 24.15.0 and current Node
- lint passed across 106 files; all four TypeScript projects passed
- baseline and CI-budget benchmarks, build, package, publish-contract, frozen install, and repository validation passed
- package provenance passed against behavioural snapshot `b43daf795de35d34602d1018ad509f68e494fe3d`
- six parallel branch-vs-main reviewers returned `SHIP` with no findings

## Review

- final reviewed head: `c3a68c04430855103ec319f70abb057009ff1a3a`
- latest-head Pullfrog review requested after this push
- merge only after every PR check is green; then hold the ordered queue until the resulting `main` CI and release-equivalent package gate are green

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `584e6915ddbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.