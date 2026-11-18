# Issue

**Title:** [MAR-2569] Bound staging cleanup to owned entries

## Description

## Human summary

Staging recovery is now bounded, ownership-specific, and fail-closed. Encephalon removes only recognised direct staging entries, preserves unknown or changed entries for inspection, and verifies both the canonical record and an empty staging generation before accepting publication.

## Summary

- add a dedicated staging authority for exact owned filenames, bounded enumeration, recovery quarantines, and directory durability
- preflight every direct staging entry before cleanup and reject excess, malformed, unsupported, late, or replaced entries without exposing arbitrary names
- keep regular files bound to descriptors, handle hard-link aliases by verified inode incarnation, and avoid recursive or symlink-following cleanup
- carry the current staging descriptor and empty-directory witness through canonical linking and final publication acceptance
- preserve stable committed `REPOSITORY_CHANGED` versus operational `IO_ERROR` classification
- document the recovery contract and the narrow final pathname-syscall limitation in Node

## Validation

- `bun run lint`
- `bun run typecheck`
- `bun run test` — 297/297
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish`
- CodeRabbit exact-head review — 0 issues
- three parallel specialist review waves completed; all high/medium-confidence issues fixed

## Linear

- [MAR-2569](https://linear.app/marcoappio/issue/MAR-2569/canonical-records-make-staging-cleanup-bounded-and-ownership-specific)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75dfff1c2a99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.