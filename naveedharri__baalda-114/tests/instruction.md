# Issue

**Title:** Remove a folder from a teammate's disk when it is made private, not just its notes

## Description

## Problem
On the Access page, making a **file** private removes it from the teammate's device. Making a **folder** private removed the notes inside but left the empty folder ("Getting Started") in their sidebar forever.

## Cause
`GET /api/folders` is permission-filtered, so a folder made private simply stops being listed — there is no tombstone because nothing was deleted. `planInbound` only removed local folders that were **tombstoned** or **moved**, so the revoked folder's notes left (as `revoked`) but the emptied directory stayed. Worse, the outbound half then saw it as "missing from the server" and re-adopted its hidden id on every pull.

## Fix
- `inbound.ts`: a local folder whose **recorded server id** is neither listed nor tombstoned has left the user's visible set → queued for removal (children first), with the same gates as a note revocation: the id must be one we recorded, the server must have answered about deletions (`null` tombstones ⇒ do nothing), the path must not have been re-created server-side, and removal stays empty-only. Capped like note revocations (`max(20, 50%)`).
- `notefile.rs`: `delete_folder_if_empty` now sweeps `.DS_Store` / `desktop.ini` / `Thumbs.db` before `remove_dir`, so a folder Finder has visited still counts as empty. Any other file still blocks removal.

## Tests
- planner: revoked folder removed children-first; `null` tombstones ⇒ untouched; re-created path ⇒ untouched; mass-revoke cap refuses and reports.
- apply (end to end): private folder + note leave together and the folder is not re-adopted; a folder holding unconfirmed local content stays.
- Rust: metadata-only folder removed, other dotfile blocks.

Desktop suite: 870 passed. `cargo test`: green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6acea98bd8a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.