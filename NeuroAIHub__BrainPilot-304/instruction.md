# Issue

**Title:** fix(runtime): ignore Finder metadata during layout migration

## Description

## Summary
- treat a root-level .DS_Store regular file as Finder metadata during v1-to-v2 persistent-layout migration
- remove the metadata only after the journaled migration has started
- keep rejecting conflicts involving any other root-level entries
- add regression coverage for the macOS local-build scenario

## Verification
- npm test -w @brainpilot/runtime -- --run src/__tests__/session-manager.test.ts
- npm run typecheck -w @brainpilot/runtime
- git diff --check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c57f87f3a90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.