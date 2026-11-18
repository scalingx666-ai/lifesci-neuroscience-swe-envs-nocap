# Issue

**Title:** [MAR-2538] Establish performance benchmarks and budgets

## Description

## Human summary

Adds repeatable performance benchmarks and budget checks so future cache work can be judged against measured prepare, hydrate, search, gather, and cache-size baselines.

## Summary

- Adds a Node-based benchmark harness that generates deterministic 0, 100, 1,000, and 10,000-record corpora with small records, large payloads, artifacts, and supersession history.
- Measures cold hydrate, unchanged prepare, stale prepare, list, show, compact search, full search, gather, peak RSS, SQLite/WAL size, and cache amplification.
- Commits a machine-readable baseline report plus broad CI smoke budgets for the 0 and 100-record profiles.
- Documents benchmark commands, platform-variance guidance, initial manual budgets, and recommended v0.1 scale guidance.
- Wires `bun run benchmark:check` into CI without changing the cache architecture.

Verification:
- `bun run typecheck`
- `bun run lint`
- `bun run test`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish` ran `prepack` successfully, then npm rejected the dry run because `0.1.0` is already published; no publish was attempted.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec1292d8c421`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.