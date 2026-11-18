# Issue

**Title:** [MAR-2553] Validate SQLite schema semantics

## Description

## Summary

- validate disposable SQLite table, column, constraint, index, and FTS5 semantics rather than accepting familiar names alone
- prevent writer paths from repairing incompatible schemas in place
- quarantine one exact incompatible cache generation, rebuild once from canonical JSON, and retry once
- preserve stable public error classifications and backwards-compatible legacy schema formatting

## Changes

- add bounded numeric-first table, column, index-list, and index-column probes before schema text materialisation
- require exact metadata and records primary-key, type, nullability, default, and visible-column semantics
- validate the records active check through a formatting-tolerant owned-SQL token comparison
- require the two canonical non-unique, non-partial BINARY indexes with exact columns and sort directions
- require standalone FTS5 with id UNINDEXED followed by indexed text and no extra options
- reject duplicate metadata keys before assigning them to the metadata map
- carry exclusive primary creation into verified writer initialisation so only newly created primaries receive DDL
- bind successful writer opens to their exact identity across repository-change retries
- preserve the internal creation-conflict sentinel and translate only at explicit public boundaries
- revalidate schema after BEGIN IMMEDIATE and before rebuild mutation
- recover unavailable private FTS modules before column introspection
- update maintained documentation and exact implementation provenance

## Compatibility

- public API signatures, CLI behaviour, package exports, canonical JSON, and existing error codes are unchanged
- harmless casing, whitespace, identifier quoting, and historical IF NOT EXISTS schema spelling remain accepted without quarantine or rebuild
- incompatible caches remain disposable and recover transparently through one exact rebuild
- FTS content equality remains assigned to MAR-2550

## Validation

- 504 tests: 502 passed, 0 failed, 2 established filesystem-capability skips
- lint passed across 104 files
- all four TypeScript projects passed
- CI-budget benchmark and package validation passed
- Encephalon validated all 38 canonical records
- local Linux x64 release-equivalent matrices passed on Node 24.15.0 and Node 26.7.0
- exact code and behavioural-test snapshot: f539720542a3302dd849002652e958da4a6063bf
- final reviewed branch head: 895a6f0355d248fe951f557789ac0f49ae53dcca

## Review

- rebased directly onto main at 5ed42d63193ddf21423b1dfcf3f15e0145586d8e
- three review waves completed across security, correctness, data consistency and races, test coverage, maintainability, and UX/API compatibility
- every accepted high- or medium-confidence finding was fixed
- final separation-of-concerns, stale-assumption, dead-code, backwards-compatibility, and documentation audit completed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ed42d63193d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.