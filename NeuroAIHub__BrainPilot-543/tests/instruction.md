# Issue

**Title:** Make Monitor opt-in by default

## Description

## Summary
- disable the bundled Monitor plugin in default Runtime snapshots
- stop advertising the Monitor capability until explicitly enabled
- keep explicit marketplace enablement and live capability updates working

## Verification
- npm run typecheck
- npm test (107 files, 1133 tests)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e2b8829ac6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.