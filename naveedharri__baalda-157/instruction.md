# Issue

**Title:** Hash-gate the incremental indexer so unchanged files cost nothing (#155 follow-up)

## Description

. Stacked on #156 (the inotify Access filter); merge that first and this diff shrinks to its own commit.

## Why

The trace of #155 showed the loop was expensive because `Index::index_notes` has no content check: every path handed to it is read, parsed and rewritten across `notes`, `notes_fts`, `note_tags` and `links`, then included in the link pass, even when the bytes are identical (~32 MB/s of SQLite writes on an idle vault). The UI then re-listed folders, re-read titles and backlinks, rebuilt the graph, and the sync layer re-hydrated cold CRDT docs and armed a push, all for a no-op. `rebuild` already skips unchanged files by mtime; the incremental path was the odd one out.

#156 fixes the event source on Linux. This is the defence in depth: any spurious `modified` on any platform (a backup, git or cloud-sync tool touching files, Windows attribute changes forwarded as `Modify(Metadata)`) now costs one read and one hash.

## Rust

- `index_one` compares the file's sha256 against the stored row for the same id **and same path**; equal → `Unchanged`, no table writes except refreshing `mtime` when it drifted (so `rebuild`'s mtime skip still fires). A NULL sha, a different path (external rename/copy) or different bytes → the old full path.
- `index_notes` returns `IndexOutcome { failures, unchanged }`; unchanged ids stay out of the link pass, so an all-unchanged batch runs none. Log line reports `N files (M unchanged)`.
- `watcher.rs`: `FileChanged` gains `unchanged: bool` via a pure `mark_unchanged`. Entries are never dropped: the TS side still needs one echo per materialised path and a `modified` still cancels a pending disk delete.

## TypeScript

- `ipc.FileChanged.unchanged?: boolean` (optional; missing = false).
- `handleLocalFilesChanged`: an unchanged mapped entry still consumes the materialised echo, still cancels a pending disk delete, and the unmapped branch still registers; it no longer clears `emptyEverywhere`/`permanentFailures`, queues a push, arms the drain, logs, or re-ingests a resident doc.
- `App.tsx` / `lazyTree.refreshWorthy`: an all-unchanged batch never arms the sidebar/titles/backlinks refresh; `HtmlView` and the graph ignore unchanged entries. The open note's bridge still receives them (echo-guarded, one read, and the only consumer that reconciles doc vs file rather than vs index).

## Tests

- Rust: 190 passed (8 new: identical bytes → unchanged with row fingerprint and link-pass count untouched; new mtime only → mtime refreshed; changed bytes → rewritten; NULL sha → indexed; identical bytes at a new path → indexed; mixed batch reports exactly the unchanged paths; `mark_unchanged`; end-to-end no-op rewrite reaches the event as `unchanged: true`).
- TS: 1684 passed, `tsc --noEmit` clean (new cases in `docSessionBulkOrder.test.ts` and `lazyTree.test.ts` for each kept/skipped line).

## Release notes

- `docs/RELEASE_NOTES.md` `## 0.1.62`: second point added.
- `CHANGELOG.md` Unreleased → Fixed, next to the #155 entry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c08bbf287cde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.