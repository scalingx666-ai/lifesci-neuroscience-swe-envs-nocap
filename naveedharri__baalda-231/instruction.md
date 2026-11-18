# Issue

**Title:** Judge an admin's writes in a pre-join folder by their join snapshot

## Description

An admin who joined while the vault's default for new members was Private or Read-only could create, rename, move or delete inside folders that existed before they joined, even though they could not read them. Folder write checks now follow the same join-time snapshot as reading.

- Owners and admins without a join snapshot (pre-existing memberships) are unchanged.
- Folders created after joining, the vault root, and anything opened with Everyone still work.
- MCP folder writes share the same gate.
- One extra memoised query per registration batch; the pinned statement counts move 10→11 and 105→106.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70fdfb052572`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.