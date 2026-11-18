# Issue

**Title:** Sync binaries anywhere in the vault as files rows and upload their extracted text

## Description

Stacked on #162; needs the server half (`feat/files-server`, follows #163) for the new routes and falls back cleanly without them.

Attachment sync now walks the whole vault for registry binary formats, not just `attachments/`: a `Team/report.docx` registers as a server `files` row via `POST /api/files` with the local stable `files.id` (persisted under `files` in `.context/config.json`), uploads with `docId` so the server's resolver ACL applies (folder shares, sealed vault, locks), and materialises on other devices at its real path through a separate `write_tree_binary` guard; `ensure_attachment_rel` stays the guard for server-supplied `attachments/` paths. Materialised paths are remembered for one watcher echo. Any `syncAs: attachment` change now routes to attachment sync from both the App hook and the note-sync filter, so a dropped `.docx` never enters the note path.

After `files-indexed`, extracted text goes to `PUT /api/vaults/:id/blobs/:blobId/text` once per blob (1 M-char cap, 404 disables for the session, 413/409 permanent per blob). Renaming a tree binary still does not propagate (sha-keyed identity; pinned by a test as Stage B's target).

Desktop vitest 1841 (+23 tree-binary cases), cargo 236, tsc and build clean. PR 3 (desktop) of the file-formats series.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f5215be4d46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.