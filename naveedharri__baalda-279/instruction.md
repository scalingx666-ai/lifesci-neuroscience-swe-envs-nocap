# Issue

**Title:** Keep content that arrives before a new note is mapped, so server-created notes are not empty

## Description

Notes created on the server (MCP `create_note`, or a teammate) could reach the desktop as empty files and stay empty.

**Problem.** The server persists the note's content and then announces the new note. The vault channel sends the doc's backfill within milliseconds, but the desktop only learns the doc id from its (debounced, HTTP) registry pull. `VaultDocStore.coldApply` dropped any update for a doc it could not place (`if (!path) return`), so the content was thrown away, the pull then materialized a 0-byte placeholder, and later deltas (e.g. an append) stayed pending because their base was gone. Edits to existing notes were unaffected.

**Fix.**
- Updates for an unmapped doc are parked per doc (bounded: 256 docs, 16 MB, 5-minute TTL) instead of dropped.
- Every registry pull goes through one `pullRegistry` helper that settles parked docs afterwards: mapped ones are applied through the normal cold-apply path (same echo guards, no `ackedSv` recorded), and ones the pull did not map are discarded without writing anything. The startup reconcile settles too, so a note created while the app was closed is filled in on launch.
- A doc evicted by the cap and mapped later triggers a vault-channel reconnect so the server re-sends it.

Tests: desktop vitest 2743 passed / 12 skipped, tsc clean; server tsc clean. New `parkedUpdates.test.ts` plus SyncManager tests for the frame pull, the startup reconcile and a failed retry pull.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5bcaa547a68e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.