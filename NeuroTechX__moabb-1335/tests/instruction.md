# Issue

**Title:** Cap the Optuna search budget in the grid-search tests (CI ~47 → ~23 min)

## Description

. Applies the test-only change @agarg21 proposed and measured in the issue (thanks!).

**Change:** `time_out=1` for the Optuna cases of `test_eval_grid_search_optuna` and `test_eval_grid_search_multimetric_scorer[*-True]`. Optuna then stops after the trial in flight. The tests still exercise the Optuna path and the primary-metric selection, and library behaviour is unchanged. Changelog line under Code health.

**Why:** since #1252, each `OptunaSearchCV` runs the default 10 trials over a 2-point grid (~110 s per case). That doubled the `Test` workflow from ~23 to ~47 min per PR; the fork measurements are in the issue.

**Checked:** with optuna 5.0 installed, the Optuna-backed cases pass on this branch in 245 s. Without it, they skip as before.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67f82f3470e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.