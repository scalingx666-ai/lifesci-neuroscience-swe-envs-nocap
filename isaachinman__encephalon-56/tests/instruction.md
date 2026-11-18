# Issue

**Title:** [MAR-2550] Verify cached FTS text integrity

## Description

## Summary

- verify every bounded cached FTS row against the exact UTF-8 search projection derived from its validated cached record
- reject missing, duplicate, orphaned, invalidly encoded, oversized, and non-canonical search rows through existing exact-generation recovery
- preserve numeric-first transfer bounds, snapshot consistency, and stable public error classifications

## Changes

- retain the bounded numeric FTS probe before reading any ID or text bytes
- derive expected search-document bytes through the existing `searchDocumentForRecord` authority
- stream at most 1,001 FTS rows as raw BLOB bytes and bind every row to exactly one validated cached record ID
- replace redundant count, distinct, missing, and orphan relationship SQL with one bounded exact-match map
- validate existing writer generations before writer PRAGMAs and destructive mutation
- require exclusively claimed retry databases to remain schema-valid and empty before PRAGMAs and after `BEGIN IMMEDIATE`
- add mutation-sensitive public-read, forced-writer, invalid UTF-8, ID-binding, retry, post-initialisation, and textual-ID-boundary coverage
- update README, changelog, maintained contract, design, plan, and exact implementation provenance

## Compatibility

- public APIs, CLI behaviour, package exports, canonical JSON, cache schema, and error codes are unchanged
- the authority is validated cached `record_json`; canonical-file equality remains assigned to MAR-2571
- no Unicode, whitespace, JSON, or token normalisation is applied
- FTS posting and shadow-index integrity is explicitly outside this row-text equality ticket

## Validation

- Node 24.15.0 and Node 26.5.0 local matrices: 511 tests, 509 passed, 0 failed, 2 established filesystem-capability skips
- lint passed across 104 files and all four TypeScript projects passed
- baseline and CI-budget benchmarks passed on both local Node versions
- build, packed-package, publish-contract, and frozen-install gates passed on both local Node versions
- Encephalon validated 38 records with no errors
- package provenance passed against code/test snapshot `2a68ce4dc839481a91b9afd6fb44a13ace13cb26`

## Review

- rebased directly onto the merged MAR-2553 `main` head
- six parallel final reviewers compared the branch with `main`; all findings were fixed or technically withdrawn, and every reviewer returned `SHIP`
- the accepted textual-ID boundary finding was mutation-checked by relaxing the production bound and observing the new test fail before restoring the bound
- the final separation-of-concerns, declarations, Bun/config, stale-code, and documentation audit is clean

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efab8b322469`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.