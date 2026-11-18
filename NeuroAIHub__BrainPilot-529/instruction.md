# Issue

**Title:** fix(runtime): cancel superseded tasks and orphan child runs

## Description

## Stack dependency

This PR is intentionally stacked on #528 (`fix/hosted-background-jobs-523`). Review and merge #528 first; this diff then contains only the task cancel/supersede lifecycle changes for #524. After #528 lands, retarget this PR to `main` before merging.

The shared tool registry conflict is already resolved in this branch: Engineer and Experimentalist retain both `run_in_background` and `cancel_task`.

## Summary

- add explicit `cancel_task` and `dispatch_task(... supersedes_task_id=...)` orchestration contracts
- persist cancelled tasks, remove stale assignments, and wake replacements immediately even when the old assignee was active
- cancel a destroyed/cancelled agent's leaf children, correlate child runs to the owning agent run, and refresh work state only after execution actually settles
- teach Principal and Experts to use structured cancellation instead of textual “SUPERSEDES” instructions

## Why

. In 208 QA, a textual replacement left the older task pending, it was redelivered after recovery, and a destroyed Engineer left a running child that kept `workState.active=true`.

## Validation

- stacked #528 + #529 Runtime suite: 65 files / 664 tests passed
- Runtime TypeScript build passed
- `git diff --check` passed
- 208 Safari real-provider test: active `task_000001` cancelled during `sleep 20`; `task_000002` completed; only `new-task.txt=NEW_TASK` exists and `old-task.txt` never appeared

## Safety notes

- only the task creator may cancel its pending task
- repeated cancellation is side-effect free and cannot abort a replacement already running on the same assignee
- workspace restore remains blocked while a cancelled child is still unwinding; `workState` turns idle only after execution settlement

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c6bdcb7f8bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.