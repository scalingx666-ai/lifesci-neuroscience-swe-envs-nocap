# Issue

**Title:** use custom extra regressors in python models c and d

## Description

python side of #213.

models c and d dropped the user's extra regressors on any fit with 0 pcs (the 0-pc baseline for pcnum selection in model c, and model d when pcnum is 0).

- models c and d now start from the user's extra regressors and append pcs, as in matlab
- `glm_estimatemodel` dropped every run's extra regressors if run 1's were empty or all zero. now handled per run, as in matlab
- `[]` now works for a run with no extra regressors
- no change with default settings

added tests for both.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34f750e2cc66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.