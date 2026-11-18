# Issue

**Title:** List files beside notes in the Access panel

## Description

Follow-up to the file-formats series: files that live in the vault tree (pdf, docx, xlsx, mp4 and the rest) now appear in Vault Settings → Access next to notes, so their access can be inspected and set exactly like a note's.

Server: `GET /vaults/:id/access-tree` returns a third array, `files: [{id, path}]`, with the same owner/admin-only, unfiltered semantics as folders and notes (a Private item must stay administrable). No change to shares or locks was needed: the resolver already treats `files` ids as docs under resource type `file`; tests now pin that.

Desktop: `AccessKind` gains `file` (the old `file` meaning note is now `note`; `accessResourceType` maps both to the server's one type), `entriesFromServer` keeps file rows, the local fallback emits them for registered `syncAs: attachment` paths via `registry.getFileId`, rows render with the sidebar's category glyph, and `resourceIdsByPath` maps file ids so a lock on a file keeps its badge. Copy says "folder, note or file" where it used to say "folder or note".

Desktop vitest 1848, server 747, both tsc clean. Known small gap: the override-count phrase still says "note settings" for file overrides (the wire has no discriminator).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2a42e47b996`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.