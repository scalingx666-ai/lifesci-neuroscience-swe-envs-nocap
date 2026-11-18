# Issue

**Title:** chore(release): prepare v0.1.1

## Description

## Release scope

- bump all public workspaces to 0.1.1
- align internal workspace dependency ranges
- refresh package-lock.json

## Verification

- npm run version:check
- npm run typecheck
- npm run build
- npm test (809 passed)
- npm run release:dry

The two open Dependabot chore PRs (#368 and #369) are not included.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e579ebf3c8dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.