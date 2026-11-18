# Issue

**Title:** Hotfix: fast attachment search on encrypted vaults

## Description

Silent hotfix (server only, one new column, backfill step).
- The file half of #385: a keyed vault's attachment text gets a small sealed score blob (vector + token set, its own AAD column), written on every text upload and by a new backfill step; file ranking reads only that. One vault's search opened 371 MB of attachment text per query (a 93 s search).
- A missing or unopenable score blob, or a match that needs the text (no token set, legacy mode, non-ASCII path), falls back to the full row as before.
- The note score backfill now guards its write on updated_at instead of sending the whole sealed row back to the database.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b4a6ebcff17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.