# Issue

**Title:** Release v0.1.86 (silent)

## Description

## What's in it

Stops a Windows desktop from re-pulling the whole registry every ~2 s when the server holds names Windows can't store.

- Server paths Windows can't hold (trailing dot/space, reserved device names, `<>:"|?*`, over 200 characters) are skipped once with a warning instead of being re-created on every pull: folders, notes, the bootstrap content apply, tree-binary downloads and inbound renames.
- The app's own writes are recognised across case, Unicode form and Windows name stripping, so they no longer look like external changes.
- Outbound never registers the Windows-stripped twin of a server name.
- Idle pull brake: after 3 registry pulls in a row that change nothing, local-reason pulls back off 2 s → 30 s; a real file change still pulls within 2 s.

No migrations. No MIN_CLIENT_VERSION change. Release notes: silent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28a895a2ad2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.