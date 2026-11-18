# Issue

**Title:** [MAR-2641] Normalise negative-zero confidence

## Description

## Human summary

Prevents JavaScript negative zero from escaping through confidence values. New records persist and return ordinary zero, while existing canonical files containing a literal `-0` remain byte-for-byte unchanged and are normalised when read.

## Summary

- normalise `confidence: -0` once at the existing schema boundary
- cover add input, canonical parsing and formatting, mutation-cache hydration, existing cache rows, public reads, and CLI output
- preserve append-only canonical files when hydrating legacy `-0` data
- document the maintained storage rule and exact reviewed implementation provenance

## Backwards compatibility

- accepted confidence values remain finite numbers from `0` through `1`
- existing error code, message, details, public types, and result shapes are unchanged
- ordinary confidence values are unchanged
- existing canonical `-0` files require no migration and are not rewritten

## Verification

- `bun install --frozen-lockfile`
- `bun run ./scripts/check-generated-version.ts`
- `bun run lint`
- `bun run typecheck` (all four TypeScript projects)
- `bun run test` (585 passed, 3 platform skips, 0 failed)
- `bun run benchmark:check`
- `bun run build` followed by a clean-tree check
- package and publish-contract checks using an isolated npm cache
- built CLI validation: 38 records checked, 0 errors

## Local review

- completed two full parallel review rounds covering security, correctness, data consistency and races, test coverage, maintainability, UX/API compatibility, and performance/resources
- addressed every valid finding and reran the complete local verification matrix
- final root audit found a single schema authority, current documentation, no stale stack code, and no unrelated changes

## Risk and rollback

The runtime change is one constant-time normalisation in the existing confidence validator. Reverting this pull request restores the previous representation without schema or data migration.

## Linear

[MAR-2641](https://linear.app/marcoappio/issue/MAR-2641/schema-normalize-negative-zero-confidence-before-publication)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71b024d77d86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.