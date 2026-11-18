# Issue

**Title:** feat(web): paste clipboard images into chat

## Description

## Summary
- accept one or more image files directly from clipboard paste events
- generate collision-safe filenames and reuse the existing attachment upload flow
- show image thumbnails, remove uploaded files, and clean up object URLs
- ignore remote HTML image references while preserving normal text paste behavior

## Verification
- npm test --workspace @brainpilot/web (58 files, 481 tests)
- npm run build --workspace @brainpilot/web

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfa775b6c827`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.