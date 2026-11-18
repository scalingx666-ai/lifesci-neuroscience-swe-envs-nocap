# Issue

**Title:** Plottopo

## Description

small adjustment to griddata, to ge better extrapolation behavior - i.e. no 'steep slopes' - beyond the outer rim of the channel array in case the to-be-interpolated data points all are far away from 0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adf8a8b58f88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.