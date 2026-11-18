# Issue

**Title:** Stop conflict renames from renaming teammates' notes; server rename guards; shared-by-default for new members

## Description

## Problem
After **Reset local copy**, the desktop's same-path conflict step mistook notes it had just downloaded for local notes clashing with a teammate's, and moved them to `<stem> (conflict YYYY-MM-DD).md`. The disk-delete drain (and `pairClosedAppRenames` on the next pull) then saw that move as a user rename and renamed the teammate's note on the server, for the whole team.

## Desktop
- A note this device already holds local CRDT for is never treated as a same-path clash.
- One pass that finds more clashes than `samePathConflictCap` (max 10 / 1%) renames none; the paths are held and reported in Health, never bound to the teammate's id.
- The registry marks its own conflict moves (`isOwnMove`), so the disk-delete drain, rename candidates and `pairClosedAppRenames` never turn them into a server rename.

## Server
- `PATCH /api/notes/:id` refuses renaming a note someone else created to a `(conflict …)` name (409 `conflict_rename_refused`; the desktop already falls back to moving its own copy).
- Renames of other people's notes are budgeted per (user, vault): 100 per 5 minutes, then 429 `rename_rate_limited`.
- New vaults also open to future members (`join_default = open` with the first collection's team grant), so people invited later see existing notes. Existing vaults are unchanged.

## Release
Version bump to 0.1.71 (silent release).

## Tests
- Desktop: full suite green, including new tests for each same-path guard.
- Server: new `rename-guard.test.ts`; `vault-default-access.test.ts` updated. The only local failures are the blob suites under a local billing env, and they pass with billing unset.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01e62da6b633`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.