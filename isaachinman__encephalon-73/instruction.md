# Issue

**Title:** [MAR-2637] Make recovery markers cross-process reclaimable

## Description

## Human summary

Completed operation-gate recovery can now be recognised and cleaned up by another process, so a failed cleanup no longer blocks the repository while the original process remains alive.

## Summary

- replaces process-local abandoned-marker authority with immutable `recovering` owner metadata and an exact durable `recovered` witness
- keeps phase-less legacy owner metadata backwards compatible by treating it as active recovery
- publishes completion only after verified SQLite `BEGIN IMMEDIATE` succeeds while exact directory, owner, token, and gate authority remain held
- lets every process reclaim an exact recovered owner-plus-witness pair without age-breaking a live active recovery
- revalidates quarantined owner and witness identity, metadata, and bytes immediately before removal, retaining replacements and failing closed
- retries bounded internal evidence races at both initial observation and stale-marker revalidation instead of exposing contention as `REPOSITORY_CHANGED`
- quarantines the exact recovery-directory generation when owner publication fails, preserving the original error and immediate retry
- preserves a witness publication failure when best-effort post-failure evidence inspection also races
- preserves existing public values, error codes, safe details, and first-failure precedence
- adds focused cross-process, crash, replacement, hard-link, durability, cleanup, concurrency, Windows-sharing, and public-error regressions

## Testing

- `bun install --frozen-lockfile`
- `bun run ./scripts/check-generated-version.ts`
- `bun run typecheck`
- `bun run lint`
- `bun run test`: 667 total, 664 passed, 3 established platform skips
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish`: expected refusal for already-published `0.2.0`
- `node dist/cli.mjs validate`: 38/38 records valid
- `git diff --check`

## Review evidence

- Fresh Round 1: six parallel Luna reviewers; fixed the valid initial-observation race and incomplete owner-publication cleanup findings, and strengthened malformed phase/shape coverage
- Fresh Round 2: six parallel Luna reviewers; fixed the valid publication-error precedence finding and both witness-publication assertions; no third round per the review protocol
- Rejected findings were documented as deliberate fail-closed behaviour, Windows directory-sync compatibility, duplicate coverage, or unrestricted same-user mutation outside the protocol threat model
- Round 2 review head: `158ca80304ecfdf7b3c886f426eb1a7b4ae93c98`
- final verified head after Round 2 fixes: `c8840b39f1c6adc1a76e88666811ab133a279f9d`

## Stack

- base: current `main` at `d8b319ae529c265d227f9ca39459a0ba80f120e1`
- ticket-pure diff: one MAR-2637 commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8b319ae529c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.