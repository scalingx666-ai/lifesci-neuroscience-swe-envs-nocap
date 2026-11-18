# Issue

**Title:** fix(e2e_workflow): keep a caller-pinned eval_dir as the run's eval_dir

## Description

## Summary

- `roles/director.md` step 2: with `EVAL_DIR_OVERRIDE` set, `EVAL_DIR` is exactly that path even when it already holds files (the caller writes there first and reads results only from there). The "append `_${RANDOM}` until fresh" rule now applies only to the generated `EXP_ROOT/e2e_${MODEL_NAME}_${TS}` path.
- `e2e_workflow.js` Setup compares the Director's `eval_dir` with the pinned path (`evalDirDivergence`, trailing slashes ignored) and fails Setup naming both paths if they differ, instead of silently adopting a sibling directory. Without a pin, the Director's choice is accepted as before.

## Test plan

- New `e2e_workflow/scripts/test_pinned_eval_dir.js` (added to the L0 Node regression job): the pinned path and a trailing-slash variant are accepted; a suffixed sibling and a missing `eval_dir` are refused when pinned; no pin accepts a generated path; Setup checks before adopting the answer; the Director prompt keeps the suffix rule to generated paths. It fails on `main` and passes with this change.
- The L0 pytest list and all L0 Node regressions locally: the same results as `main` (three pre-existing failures in this environment are unchanged on `main`).

## Related issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e69579e965b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.