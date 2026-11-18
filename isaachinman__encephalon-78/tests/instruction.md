# Issue

**Title:** [MAR-2575] Read one stable canonical corpus generation

## Description

## Summary

- bind canonical reads and validation to one bounded, stable root/kind/record/artifact generation
- retry complete changed generations through one three-attempt, non-resetting 60-second ledger
- preserve stable validation results and existing public error codes, result shapes, canonical JSON, cache schema, manifest format, and package surface
- keep record and artifact evidence current with an artifact-record-artifact closing validation sandwich
- normalise operational filesystem failures without exposing repository paths and close rejected-record descriptors on every outcome

## Scope

Implements [MAR-2575](https://linear.app/marcoappio/issue/MAR-2575/canonical-records-read-and-validate-one-stable-corpus-generation) for read and validation paths only. Canonical mutation, initialisation batching, and cache-equivalence work remain in their separate tickets.

## Backwards compatibility

- no public API or CLI shape changes
- no new runtime dependencies
- no canonical record, artifact, cache, manifest, or instruction-format changes
- stable invalid repositories retain their existing validation output
- existing error-code and deterministic retry behaviour is preserved

## Review

- completed two fresh six-role local Luna review rounds
- addressed every valid security, correctness, race, test, maintainability, and UX/API finding
- final implementation provenance: `c17834e5d4f4129c8f8374713be224c54ab4a39f`

## Verification

- `bun install --frozen-lockfile`
- `bun run ./scripts/check-generated-version.ts`
- `bun run typecheck`
- `bun run lint`
- `bun run test` — 750 tests, 747 passed, 0 failed, 3 skipped
- `bun run benchmark:check`
- `git diff --exit-code HEAD` after build
- `bun run check:package`
- `bun run check:publish`
- `node ./dist/cli.mjs validate` — 39 records valid

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e058b655794`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.