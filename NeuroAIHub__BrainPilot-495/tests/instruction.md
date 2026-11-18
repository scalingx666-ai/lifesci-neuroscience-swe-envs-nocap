# Issue

**Title:** fix(web): recover unsent drafts and attachments after reload

## Description

## Summary
- persist unsent composer text and attachment filenames in browser storage so reloads and reopened tabs can recover the draft
- restore a recoverable new-conversation draft before the previously selected session, without yanking users away from an intentionally selected session
- rebuild attachment chips after reload, keep late upload completions scoped to their original conversation, and clean metadata on remove, session deletion, or successful send

Only draft text and attachment filenames are stored in `localStorage`; file contents remain in Runtime's existing staged attachment storage.

## Verification
- production Web build passed
- targeted draft/session/attachment tests: 25 passed
- full repository test suite: 95 files, 1063 tests passed
- browser flow: upload + type in a new draft, close/reopen the page, recover both, remove the attachment, verify browser metadata and the Runtime file are deleted, then clear text and verify the prior session is restored

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59185430294c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.