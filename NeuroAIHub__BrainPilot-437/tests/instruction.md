# Issue

**Title:** fix(runtime): prevent repeated Auditor reviews

## Description

## Summary

- consume each host-bound Auditor review target once, including parallel duplicate calls
- make finalized node and parent-edge reviews idempotent and prevent conflicting overwrites
- bind terminal events and run stats to the immutable run ID captured at run start

.

This intentionally does not change audit fingerprints, durable queue formats, Auditor read tools, or normal first-review behavior.

## Verification

- `npm run typecheck --workspace packages/runtime`
- focused runtime tests: 62/62 passed
- runtime suite: 568/569 passed in parallel; the sole failure was the existing shared-`BP_DATA_DIR` isolation issue in `ask-user.test.ts`, which passed 15/15 when rerun alone in a clean directory

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `602bf6c7c6fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.