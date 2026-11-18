# Issue

**Title:** [MAR-2635] Reject hard-linked mutable cache files

## Description

## Human summary

Prevents Encephalon from opening, mutating, rolling back, closing, or identity-cleaning SQLite cache and operation-gate files when another hard-link pathname exists. Existing single-link caches, public APIs, schemas, formats, successful outputs, and established error precedence remain backwards compatible.

## Summary

- require exactly one hard link for `brain.sqlite`, `operation-lock.sqlite`, and their WAL, SHM, and journal sidecars at every existing verification, quarantine, and final-close boundary
- distinguish unlinked descriptor observations from multiply-linked stable generations so ordinary teardown retains bounded retry and replacement races retain `REPOSITORY_CHANGED`
- preserve creation-conflict, replacement, quarantine, validation, and operational I/O error precedence with repository-relative bounded details
- permit post-transaction SQLite rollback and close only after cache containment, the captured primary, and every sidecar are positively proven safe
- retain unsafe open connections in a bounded four-entry process-lifetime latch and document deterministic remove-layout-and-restart recovery
- add focused static, replacement, descriptor-boundary, post-BEGIN, redirect, quarantine, disclosure, error-precedence, fresh-bootstrap, final-close, and bounded-resource coverage

## Testing

- `bun install --frozen-lockfile`
- `node ./scripts/check-generated-version.ts`
- `bun run typecheck`
- `bun run lint`
- `bun run test` — 639 total, 636 passed, 3 established platform skips, 0 failed
- `bun run benchmark:check`
- `bun run build`
- `node ./scripts/check-package.ts`
- `node ./scripts/check-publish.ts` — expected already-published `0.2.0` refusal
- `git diff --check`

## Review evidence

- fresh local round 1: six parallel Luna reviewers; every valid finding addressed
- fresh local round 2: six parallel Luna reviewers; every valid finding addressed
- security: SHIP
- correctness: SHIP
- data consistency and races: SHIP
- test coverage: SHIP
- maintainability and separation of concerns: SHIP
- UX, API, and backwards compatibility: SHIP
- reviewed and fully verified implementation: `e51c16eacdb5acc08fc5a0f77c31a605ef790e38`
- post-review CI corrections release the test-only close-safety latch before Windows removes temporary repositories and classify post-rename link transitions consistently across platforms; targeted Luna validations returned SHIP

## Integration

- base: current `main` at `696b35e84905f7219bfaddde59f1e127bbc4d76d`
- this PR is ticket-pure and contains only MAR-2635 changes
- merge only after exact-head CI and exact-head Pullfrog are green

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `696b35e84905`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.