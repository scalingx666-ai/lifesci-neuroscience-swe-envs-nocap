# Issue

**Title:** Fix LatestTaskExecutor stalling after a rejected task

## Description

### Summary
- `LatestTaskExecutor` only handled fulfillment: a rejected (or synchronously throwing) task left its caller's promise pending, kept the queue entry and never started the next task. One failed bucket-picking task could therefore stop all further bucket picking for a layer.
- Rejections and synchronous throws now reject the corresponding caller's promise, and the queue always advances.
- Added spec cases for rejection and recovery.

### Steps to test:
- `yarn test latest_task_executor`

### Issues:
- none

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7335d04a3c27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.