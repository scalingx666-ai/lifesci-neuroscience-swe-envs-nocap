# Issue

**Title:** fix: remove lint step from CI

## Description

## Summary
- Remove lint step from CI workflow (ESLint not installed as dependency)
- Remove lint script from root package.json
- Build and typecheck still run on PRs

## Context
`next lint` requires `eslint` as a dev dependency. The web package has `eslint.ignoreDuringBuilds: true` in next.config.ts, so lint was never configured for this project. Removing from CI to unblock builds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c1d51139b5dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.