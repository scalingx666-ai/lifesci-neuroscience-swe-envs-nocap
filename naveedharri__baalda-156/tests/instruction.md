# Issue

**Title:** Drop inotify read-access events in the vault watcher (Linux re-index loop, #155)

## Description

On Linux, `notify`'s inotify backend subscribes with `WatchMask::OPEN`, so every read of a note or directory produces an `EventKind::Access` event. The watcher forwarded every event's paths, `plan_batch` classifies any existing `.md` as `modified`, and indexing a batch reads the notes in it, so an idle vault re-indexed itself forever (264–335 `index_notes` runs a minute, ~32 MB/s into `index.sqlite`, as measured by @cjpatten on a 503-note vault).

## Fix

`watcher.rs should_forward`: the callback drops an event iff it is `Access(_)`, is not `Access(Close(Write))`, and carries no Rescan flag. Everything that can mean "bytes changed" still gets through; `Close(Write)` is kept as the in-place editor's end-of-write signal and a Rescan-flagged event is kept because the backend queue overflowed. macOS (FSEvents) and Windows (`ReadDirectoryChangesW` without `LAST_ACCESS`) never emit Access, so their behaviour is unchanged.

Follows the design proposed in the issue; implemented as a plain function in `watcher.rs` with three unit tests pinning the truth table.

## Verification

- `cargo test` in `src-tauri`: 182 passed, 0 failed (lib) + integration suite green; `cargo clippy --all-targets` clean.
- Not reproducible on macOS by construction; the reporter's measurement of the same filter on Linux went from 264–335 `index_notes`/min to 0 in 50 s.

## Release notes

- `docs/RELEASE_NOTES.md`: new `## 0.1.62` section, one point.
- `CHANGELOG.md`: entry under Unreleased → Fixed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c08bbf287cde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.