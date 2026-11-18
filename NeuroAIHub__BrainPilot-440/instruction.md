# Issue

**Title:** fix(runtime): prohibit PI from running training

## Description

## Summary
- make the PI training prohibition explicit and absolute
- forbid PI-run pilot/smoke training, fine-tuning, CV fitting, checkpoint resume, hyperparameter search, and distributed training
- require every parameter-fitting process to be delegated to Engineer
- retain PI access to configurations, logs, status inspection, and waiting

## Validation
- `npm run typecheck --workspace packages/runtime`
- persona and SessionManager tests: 75/75 passed
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b018e14e49c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.