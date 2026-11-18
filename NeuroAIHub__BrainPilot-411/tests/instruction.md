# Issue

**Title:** feat(got): inject trace context into reasoning

## Description

## Summary

- inject the latest compact GoT ephemerally into every Principal model turn without persisting snapshots in chat history
- grant Principal read-only graph, node, neighborhood, and checkpoint-diff tools
- inject bound target evidence, local neighborhood, compact active graph, and consistency guidance into background GoT audits
- attach Session Start only when a node has no parent of any conclusion, while allowing Trace to explicitly propose and audit the root
- remove the intent-blind Principal delegation reminder while preserving trace and expert-reply reminders

## Stack

- stacked on #409 (`codex/fix-session-state-and-shutdown`)
- after #409 merges, this PR can be retargeted to `main`

## Validation

- `npm test`: 83 files / 918 tests passed
- `npm run typecheck`: passed
- `git diff --check`: passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1f5d19f6f07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.