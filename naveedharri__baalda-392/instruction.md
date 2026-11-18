# Issue

**Title:** Revoked files leave the ex-reader's disk instead of staying in .context/trash

## Description

## Problem

When an owner removes someone's access to a folder, that person's notes are deleted from their computer, but the folder's other files (PDF, Excel, images…) are not. Since `c62397d6` (14 Oct), `removeRevokedBinary` moves them into the vault's hidden `.context/trash` as a recovery copy. Nothing ever cleans that folder, so the file stays readable on the ex-reader's disk. A customer reported it as a confidentiality breach on 3 Nov.

## Change

`registry.ts removeRevokedBinary`:
- **Someone else's file** is deleted with `ipc.deleteFile`, the same way a revoked note is.
- **A file this user created** (`authoredDocs`) still moves to `.context/trash`, matching how a revoked note keeps its author's unsent work.

Nothing else changes:
- The server must name the file, the access check must agree, and the bytes must be confirmed upstream (`filesConfirmed`).
- `suppressBinaryDelete` still keeps the removal from going back to the server as a user delete.
- A failed delete still keeps the file and its id for retry.

`CLAUDE.md` is updated to describe the new rule.

**This reverses part of `c62397d6`.** That commit's reason was "a wrong server revocation must not destroy work". The checks above are what protect against that: a confirmed file's canonical copy is on the server and the owner's disk. @naveedharri please confirm you're happy with deleting here.

## Not covered

- Copies already in `.context/trash` from removals since 14 Oct stay. Affected members need to delete them by hand. Going forward we could record revoked-file trash paths so they can be cleaned up.
- Files left in place on purpose (bytes never confirmed, or the access check failed) are unchanged. The owner still isn't told about them.

## Tests

- `inboundApply.test.ts`: the revoked-binary tests now assert the file is deleted, nothing goes to `.context/trash`, and a failed delete keeps the file and its id. The uploader keeps a recovery copy.
- `vitest run src/lib/sync`: 1082 passed. `tsc --noEmit`: clean.
- The full desktop suite has 3 failures unrelated to this change:
  - `session.redteam3` times out on `staging` without this change too.
  - `frontmatter` and `livePreviewMedia` are flaky: they pass and fail on reruns.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7db03e87dd12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.