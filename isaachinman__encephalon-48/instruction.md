# Issue

**Title:** [MAR-2557] Bound baseline directory enumeration

## Description

## Summary

- stream at most 513 raw entries from each baseline root, language, and workflow directory before filtering
- omit overflowed or unreadable sources instead of retaining filesystem-order-dependent partial facts
- verify package metadata and workflow ancestry against stable, no-follow filesystem generations
- bind recursive child scans and all baseline sources to coherent parent and repository generations
- preserve literal `package.json` semantics and platform-correct source attribution across casing variants
- report bounded, ordinal-sorted scan reason codes without leaking filenames, paths, or raw errors
- document the maintained baseline enumeration and source-attribution contract

## Why

Baseline discovery previously materialised complete directories before applying its 512-entry cap, while top-level and workflow enumeration were uncapped. Filesystem and package parsing failures could also be silently omitted, making an incomplete baseline appear complete.

## Validation

- `bun run lint`
- `bun run typecheck`
- `bun run test` — 316 passed, 0 failed, 2 filesystem-capability skips
- Linux case-sensitive manifest regressions — 2/2
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish`

Linear: [MAR-2557](https://linear.app/marcoappio/issue/MAR-2557/baseline-bound-every-directory-enumeration-and-report-skipped-work)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54b74c405a25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.