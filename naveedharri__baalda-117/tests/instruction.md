# Issue

**Title:** Remove a revoked note outright and say access was removed in the banner

## Description

## Problem
When a note (or its folder) is made private, the teammate's device moved the file to `.context/trash/…` and showed "A teammate deleted this note. Your copy was moved to …". Nothing was deleted, and keeping a readable copy defeats the point of revoking access.

## Change
- `registry.ts`: a `revoked` note is now removed with `deletePath` (the same epoch-pinned Rust call the sidebar's Delete uses) instead of `trashNote`. Deleted notes still go to the vault trash. The server keeps the content, and restoring access re-materialises the note (existing round-trip test).
- `noteRemoved` carries a `reason` through `InboundHost` → `SyncManager` → store, and `noteRemovedByTeammate` becomes `{ reason, trashedTo }`.
- Banner: revoked → "Your access to this note was removed. It is no longer on this device."; deleted → unchanged.

## Tests
Apply tests assert the revoked file is deleted (not trashed) and the host receives `reason: "revoked"`; the private-folder test asserts the same. Desktop suite: 870 passed, tsc clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5747c3b7615f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.