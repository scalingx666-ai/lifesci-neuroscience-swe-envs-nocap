# Issue

**Title:** fix(run_e2e): do not report a run cut off before Finalize as no_gain

## Description

## Summary

- `_recover_completed_no_gain` (`interface/run_e2e.py`) is the last recovery tier and reported any run with a measured baseline and no accepted change as `no_gain`. A run cut off mid-optimization (deadline, kill, crash) has both too, so the caller was told GEAK finished and found nothing, and the classified error (for example `timeout`) was lost.
- It now also requires the Finalize bundle (`final/final_launch.sh`). Without it, recovery returns `None` and the run surfaces its classified error. A finished no-gain run, which writes the bundle, is still reported as `no_gain`.

## Test plan

- New `test_a_run_cut_off_before_finalize_is_not_no_gain` in `interface/test_run_e2e_recovery.py`: with the bundle removed, both `_recover_completed_no_gain` and `_recover_workflow_return` return `None`. It fails on `main` and passes with this change; the existing no-gain recovery tests still pass.
- The L0 pytest list and all L0 Node regressions locally: the same results as `main` plus the new test (three pre-existing failures in this environment are unchanged on `main`).

## Related issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `243cb77ab3b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.