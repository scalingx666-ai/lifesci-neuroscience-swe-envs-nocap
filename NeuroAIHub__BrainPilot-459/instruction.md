# Issue

**Title:** fix(web): preserve copied workspace file links

## Description

## Summary

- render workspace Markdown links as stable, session-aware browser URLs that survive copying and refresh
- reopen canonical and legacy workspace file URLs in the owning session
- attach delayed directory responses to the directory that issued each request

## Dependency

This is intentionally stacked on #456 so the review shows only the follow-up fixes. After #456 merges, retarget this PR to `main`.

## Verification

- TDD regressions for copied deep links, legacy URLs, session ownership, and delayed directory responses
- `npm test -w @brainpilot/web` (65 files, 519 tests)
- `npm run build -w @brainpilot/web`
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79e38f289241`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.