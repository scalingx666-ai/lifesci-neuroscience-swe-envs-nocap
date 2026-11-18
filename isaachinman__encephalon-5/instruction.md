# Issue

**Title:** Normalise the npm binary manifest

## Description

## Summary

- use npm's canonical binary target spelling so publication does not rewrite the manifest
- keep nested package inspection active during npm publish dry-runs
- add regression coverage for both behaviours

## Verification

- bun run typecheck
- bun run test
- bun run build
- bun run check:package
- npm publish --dry-run --access public --json

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7298e4602a18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.