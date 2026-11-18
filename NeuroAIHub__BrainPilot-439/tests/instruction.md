# Issue

**Title:** feat(runtime): require Engineer accelerator preflight

## Description

## Summary
- require Engineer to inspect runtime, memory, disk, dependencies, and accelerator availability before substantive execution
- verify framework-level GPU allocation with a bounded smoke test rather than trusting device visibility alone
- prefer GPU acceleration for suitable workloads while preserving CPU fallback, reproducibility, and authorization boundaries
- inject the rule into existing on-disk Engineer persona overrides exactly once

## Validation
- `npm run typecheck --workspace packages/runtime`
- persona and SessionManager tests: 75/75 passed
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b1415d68d43`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.