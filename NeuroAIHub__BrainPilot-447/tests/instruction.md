# Issue

**Title:** feat(runtime): guard required PI expert delegation

## Description

## Summary
- add an independent Principal workflow guard extension for sessions marked `expert_required`
- inject fresh ephemeral delegation state and issue at most one bounded follow-up per user-work epoch
- count only successful TaskLedger dispatches to substantive Experts; Auditor, Writer, and Trace do not satisfy the guard
- persist the workflow policy and guard epoch state across restore
- expose `--workflow-policy expert_required` in the headless client

## Safety
- defaults to `direct`, preserving existing sessions and ordinary replies
- does not inspect or block `bash`, `write`, `edit`, status checks, or sleep
- stays independent from GoT/trace auditing

## Verification
- `vitest`: 70 files, 683 tests passed
- `tsc -b packages/protocol packages/runtime packages/client-cli`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dadb648532a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.