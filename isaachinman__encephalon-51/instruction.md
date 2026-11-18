# Issue

**Title:** [MAR-2548] Make partial initialisation restart-safe

## Description

## Summary

- preserve each failing subsystem's existing error code, message, cause, and safe details while adding bounded `initProgress`
- report deterministic record commit IDs, instruction file actions, phase, cache state, and fixed recovery guidance across partial initialisation failures
- make same-options retries converge after partial record, cache, instruction, refresh, removal, and operation-cleanup failures
- retain first-failure authority across operation-lock cleanup and post-link record verification, with identity-safe staging recovery
- keep record and instruction commit-point knowledge in their owning subsystems while `init` owns only cross-phase orchestration
- document the monotonic, non-transactional contract and exact audited implementation provenance

## Compatibility and safety

- no new public error code, result type, package export, or declaration surface
- no payloads, instruction contents, absolute paths, raw causes, ownership tokens, or arbitrary filesystem names are added to public details
- `bun.lock` remains plaintext and `bunfig.toml` retains telemetry-disabled exact installs

## Verification

- `bun run lint`
- `bun run typecheck`
- `bun run test` — 428 passed, 2 filesystem-capability skips, 0 failed
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected handled refusal for already-published `0.2.0`
- `bun install --frozen-lockfile`
- CodeRabbit exact-head review — 0 issues
- three specialist review waves covering security, correctness, data races, tests, maintainability, and UX/API compatibility

Linear: [MAR-2548](https://linear.app/marcoappio/issue/MAR-2548/init-make-partial-initialization-commits-explicit-and-restart-safe)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a174c3e1092f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.