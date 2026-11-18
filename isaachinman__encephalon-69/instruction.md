# Issue

**Title:** [MAR-2576] Avoid payload descriptor-map amplification

## Description

## Human summary

Payload validation now rejects oversized arrays before expensive property discovery and validates objects without building a complete descriptor copy. This reduces hostile-input memory amplification while preserving public APIs, canonical bytes, and stable validation errors.

## Summary

- add a dependency-free guarded property-inspection boundary for prototype, own-key, and individual descriptor reads
- replace whole-object descriptor maps with iterative, single-list payload inspection
- preflight array length before own-key enumeration or output allocation and reject stateful length changes
- retain the existing 10,000-node and 64-level limits, hidden-property tolerance, traversal order, proxy error precedence, and canonical JSON output
- add deterministic retained-value and output-container work observations without exposing a public hook
- add boundary, hostile-proxy, sparse/accessor/symbol, reordered-key, stateful-length, package, canonical-byte, and allocation regressions
- document the maintained payload-validation and performance contracts

## Backwards compatibility

- public exports, TypeScript types, result shapes, error codes, error details, and ordinary-input messages are unchanged
- valid payloads retain byte-for-byte canonical output and persistence behaviour
- accessors remain uninvoked; symbols, sparse arrays, cycles, depth/node excesses, and hostile metadata still fail closed
- internal observer failures preserve their original exception, matching existing instrumentation boundaries

## Verification

- `bun install --frozen-lockfile`
- `bun run ./scripts/check-generated-version.ts`
- `bun run lint`
- `bun run typecheck` (all four TypeScript projects)
- `bun run test` (591 passed, 3 platform skips, 0 failed)
- `bun run benchmark:check`
- package and publish-contract checks using an isolated npm cache
- built output clean-tree check
- built CLI validation: 38 records checked, 0 errors

## Local review

- completed two parallel Luna review rounds covering security, correctness, data consistency and races, test coverage, maintainability, and UX/API compatibility
- addressed every valid finding, including stateful proxy length coherence and original observer-error propagation
- reran the complete local verification matrix after the final fixes
- final root audit found separated inspection/validation concerns, current documentation, no stale experimental code, and no unrelated changes

## Risk and rollback

The change is confined to payload validation and internal test instrumentation. Reverting this pull request restores the previous traversal without stored-data migration.

## Linear

[MAR-2576](https://linear.app/marcoappio/issue/MAR-2576/schema-avoid-descriptor-map-amplification-before-payload-budgets)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44ef7f714efe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.