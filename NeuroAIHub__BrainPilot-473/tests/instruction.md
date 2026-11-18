# Issue

**Title:** fix(runtime): bound repeated Bash polling

## Description

## Summary
- detect identical Bash commands repeated within a 60-second agent-run window
- inject one ephemeral English warning on the third execution, including the fifth-call cutoff
- block the fifth execution and terminate the current agent turn
- reset after successful write/edit operations or a new agent run

## Verification
- runtime typecheck passes
- targeted Bash guard and wrapper tests: 7 passed
- runtime suite: 658/659 passed; the sole temporary-directory cleanup race passed on isolated rerun

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ece7fe1a211e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.