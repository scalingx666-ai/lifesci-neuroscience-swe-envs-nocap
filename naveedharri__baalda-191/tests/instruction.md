# Issue

**Title:** Stop phantom binary deletes and self-heal dead file ids

## Description

Files that never left disk were losing their server `files` rows, then stuck "syncing" forever.

**Root cause (prod, 2026-09-22):** the binary delete queue treated any failed `file_stat` as "deleted" and sent `DELETE /api/files/:id` for 88 present files. The device kept the dead ids, so every upload got 400 `invalid_rel_path` and retried each pass (1,677 failed intents/hour for one vault).

**Fix**
- Rust `binary_exists`: `false` only for a real not-found; other errors reject (= "couldn't ask").
- Drain refuses to delete any path still in the disk listing.
- 400 `invalid_rel_path` on an upload with a `files` id drops the dead id (registry + session cache) and re-registers once; delete-queue forgets now clear the mirror's cache too.
- `DELETE /api/files/:id` writes a `file_tombstones` row.

**Tests:** desktop 2323 passed, cargo 263 passed, server 942 passed; the 3 `blob-text` failures also fail on unmodified `staging` (local billing env).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbfe7b6d71ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.