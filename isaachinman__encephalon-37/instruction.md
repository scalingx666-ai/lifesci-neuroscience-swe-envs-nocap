# Issue

**Title:** [MAR-2540] Resolve implementation plan drift

## Description

## Human summary

Turns the old implementation plan into historical context and adds a concise maintained contract.

## Summary

- Adds `docs/contract.md` as the maintained v0.x contract for public API/CLI behaviour, canonical storage, init privacy, cache compatibility, package gates, and future contract changes.
- Marks `docs/implementation-plan.md` as historical design input with the audited commit/date and links to the maintained contract.
- Adds a divergence checklist mapping known plan drift to implemented tests, accepted decisions, or owning Linear tickets.
- Reconciles installed-command guidance around `npx --no-install encephalon ...`.
- Records that `canonicalRecordPath` remains an internal helper used by cache path validation and is not part of the public `src/index.ts` API.
- Adds package-contract tests for the historical-plan status, maintained contract sections, and installed-command guidance.

Verification:
- `bun run typecheck`
- `bun run lint`
- `bun run test`
- `bun run build`
- `bun run check:package`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `deb196cb9206`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.