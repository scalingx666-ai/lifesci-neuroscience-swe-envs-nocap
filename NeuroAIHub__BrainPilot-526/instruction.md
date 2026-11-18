# Issue

**Title:** fix(ux): keep new conversations out of stale Files routes

## Description

## Summary

Partial OSS fix for #521; the hosted hard-refresh companion is tracked in the linked Cloud PR.

- excludes `/app` and other unambiguous application roots from legacy naked-file parsing, so `/app` is no longer converted to `/workspace/app`
- resets a canonical `/sessions/:id/files` URL back to `/app` when the user switches conversations or opens a draft
- clears the stale file request while keeping the Files panel preference
- preserves a copied file deep link until its owning session/file is resolved once

## Verification

- `npm test -w @brainpilot/web -- workspaceFileLink.test.ts sessionSelection.test.ts` — 26 passed
- `npm test -w @brainpilot/web` — 80 files / 647 tests passed
- `npm run build -w @brainpilot/web` — production build passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee3215d10c48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.