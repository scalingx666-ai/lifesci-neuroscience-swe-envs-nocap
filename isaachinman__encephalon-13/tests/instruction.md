# Issue

**Title:** [MAR-2516] Rebuild malformed cache state

## Description

## Human summary

Treats the SQLite cache as disposable: malformed cached metadata, rows, or search state are rebuilt from canonical JSON instead of being returned.

## Summary

This PR fixes MAR-2516 by hardening disposable SQLite cache reads and freshness checks:

- validates cache metadata keys, value types, size limits, artifact paths, and `recordsIndexed` bounds
- validates `recordsIndexed` against stored record rows and FTS rows
- detects missing, duplicate, and orphaned FTS rows before treating metadata as fresh
- validates cached `record_json` through the canonical record schema plus runtime path checks
- rejects cached records with unknown fields, malformed JSON, invalid paths, or oversized serialized rows
- derives compact search record fields from validated cached records rather than trusting parallel cache columns
- removes SQLite WAL, SHM, and rollback-journal files when discarding corrupt cache state
- rebuilds once under the operation lock when list, show, full search, compact search, or gather first observe recoverable cache corruption
- preserves `CACHE_SCOPE_MISMATCH` for valid caches bound to a different repository realpath
- adds regression coverage for invalid rows, invalid cached record shapes and paths, unsafe metadata, invalid counts, oversized metadata, missing/duplicate FTS rows, and all public read surfaces

Local verification passed:

- `bun run lint`
- `bun run typecheck`
- `bun run test`
- `bun run build`
- `bun run check:package`
- `node dist/cli.mjs validate`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17015eb168a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.