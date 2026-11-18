# Issue

**Title:** [MAR-2667] Keep init batches on one canonical generation

## Description

## Summary

- plan and validate every generated init record from one stable canonical snapshot per attempt
- replan the complete batch only before its first canonical commit, using the existing bounded retry ledger
- stop immediately after any post-commit canonical change and report the exact ordered committed-record prefix with deterministic recovery guidance
- verify the accepted canonical generation through cache preparation before applying instruction-file changes
- preserve existing subsystem error codes, success shapes, and idempotent rerun behaviour
- update the public contract and add focused concurrency, retry-bound, error-precedence, and convergence coverage

## Test plan

- `bun run test` — 790 tests, 787 passed, 3 skipped
- `bun run lint`
- `bun run typecheck`
- `bun run build`
- `node ./scripts/check-generated-version.ts`
- `bun run benchmark:check`
- `node ./scripts/check-package.ts` with an isolated npm cache
- two complete six-role local Luna review rounds; all valid findings addressed

## Compatibility and risk

- Public API inputs, successful result shapes, and canonical JSON remain unchanged.
- Existing error codes are preserved unless a canonical generation change after a committed prefix requires the established `REPOSITORY_CHANGED` contract.
- The change is limited to init batch sequencing and shared internal canonical-generation authorities.

Linear: MAR-2667

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2780079fb406`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.