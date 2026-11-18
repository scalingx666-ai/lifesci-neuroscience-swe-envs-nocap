# Issue

**Title:** chore(release): bump version to 0.1.0

## Description

## Summary
- bump the monorepo and all workspaces to 0.1.0
- update internal @brainpilot dependency ranges and package lock
- remove the obsolete API-version sentinel assertion now that 0.1.0 is the real version

## Verification
- npm run version:check
- npm run typecheck
- npm test (784 tests)
- npm run release:build
- npm run release:dry

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd9bdf9a05e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.