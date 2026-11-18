# Issue

**Title:** [MAR-2568] Replace source-regex performance guards

## Description

## Summary

- replace source-text regex assertions with pass-scoped behavioural work observers
- count actual collection reads and writes for record and baseline accumulators
- cover exact supersession, workflow, and bounded directory work while preserving deterministic output
- keep observer mechanics internal, inactive when no observer is supplied, and absent from public declarations
- return ordinary result containers and preserve internal observer failures across every hook-enabled reader
- document the boundary between correctness work counts and benchmark budgets without regressing existing provenance

## Verification

- `bun run lint`
- `bun run typecheck`
- `bun run test` — 546 passed, 2 established capability skips
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` — expected refusal for already-published 0.2.0, gate exit 0
- `bun install --frozen-lockfile`
- six-role independent final review at `71f20d9`: SHIP with no P0–P3 findings

## Review evidence

The former group, error-array, Set, language-Map, and top-level-array copying patterns were reintroduced without changing instrumentation. The focused behavioural suite failed, then returned green after restoring bounded accumulation. Review follow-ups additionally proved that observer-free scans avoid per-entry callbacks, hook-enabled results remain ordinary cloneable values, and observer failures retain their original identity across validation, readers, graph assertions, and initialisation paths.

## Merge order

- based directly on `main` after merged PR #59
- Linear: MAR-2568

## Checklist

- [x] Tests cover the behaviour change
- [x] Documentation matches the current implementation
- [x] Public declarations and package surface are unchanged
- [x] No lockfile, package, or TypeScript configuration drift

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69adee196b52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.