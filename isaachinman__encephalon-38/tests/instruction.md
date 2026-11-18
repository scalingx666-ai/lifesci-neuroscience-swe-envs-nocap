# Issue

**Title:** [MAR-2528] Sort directory entries before applying scan caps

## Description

## Summary
- Fixes the follow-up Pullfrog finding on #25: directory entry caps are applied after sorting accepted names, so truncation under `MAX_DIRECTORY_ENTRIES` is deterministic across filesystems.
- Adds a regression that mixes lexicographically early TypeScript files with late Python files and asserts stable `languageCounts` after truncation.

## Test plan
- [x] `bun run typecheck`
- [x] `bun run lint`
- [x] `bun run test`
- [x] `bun run build`
- [x] `bun run check:package`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75b15d246935`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.