# Issue

**Title:** [MAR-2567] Run pull-request checks across supported Node versions

## Description

## Human summary

Pull requests now run the full safe CI suite across the minimum and current Node versions, while release packaging remains restricted to trusted pushes to `main`.

## Summary

- run CI for pull requests targeting `main` and cancel superseded runs
- preserve the existing Linux, macOS, and Windows required checks on Node 24.15.0
- add an Ubuntu check on Node 26 that exercises the packed package and CLI contract
- prevent checkout credentials from persisting into untrusted verification steps
- run the release-equivalent package gate once on trusted `main` pushes, with bounded artifact retention
- document the verification and release lanes and add focused workflow contract coverage

## Validation

- `bun run lint`
- `bun run typecheck`
- `bun run test` (159 tests)
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish`
- `actionlint .github/workflows/ci.yml`
- `git diff --check origin/main...HEAD`

Linear: [MAR-2567](https://linear.app/marcoappio/issue/MAR-2567/ci-run-pull-request-checks-and-cover-the-current-node-major)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54050ff63d07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.