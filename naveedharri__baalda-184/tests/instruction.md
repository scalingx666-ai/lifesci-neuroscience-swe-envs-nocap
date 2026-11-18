# Issue

**Title:** Keep revoked binaries on disk until their bytes are confirmed upstream

## Description

## Why

A tree binary gets a server `files` row before its bytes upload, and the upload can be refused for good (Free plan standalone files, blob size ceiling, full storage quota). The row was read as proof the server held the bytes, so a later revocation named the file on `ready.revoked`, the access-check agreed, and the desktop deleted the only copy. Notes are protected here by the `isPushed` refusal; binaries had no equivalent.

## What

- New persisted `filesConfirmed` set in `.context/config.json`, set only by a completed upload, a download, a dedupe adoption, or a match against the server's ready-blob listing. Registering a row never confirms.
- `removeRevokedBinary` refuses an unconfirmed file, leaves it on disk and records an `orphan` failure with the note rail's wording.
- `hello.files` announces only confirmed ids, so the server never names an unconfirmed binary and the ACL-authority clock is not re-stamped every reconnect.
- Older configs load unconfirmed and settle on the next listing pass without re-uploading. Keyed by doc id so renames carry it.
- Release notes: the unreleased 0.1.62 section is folded into 0.1.63 so users updating from 0.1.61 see everything. Changelog Unreleased gets a Fixed entry.

## Tests

- `tsc --noEmit` clean
- desktop vitest: 2314 passed, 12 skipped, 0 failed (nine new cases: unconfirmed kept with failure recorded, unconfirmed not announced, config round-trip and legacy load, confirmation dropped on forget and carried on rename, upload confirms, Pro-refused upload confirms nothing, listing sha match confirms without uploading, `attachments/` drops confirm nothing)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3541243e8236`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.