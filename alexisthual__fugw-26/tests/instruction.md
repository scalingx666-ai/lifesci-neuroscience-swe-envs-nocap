# Issue

**Title:** Feature/allow not setting convergence criteria

## Description

Rename `early_stopping_threshold` to `tol_loss`.
For BCD or solver early stopping, allow setting only `nits_*` or `tol_*` and raise exception when both are not set.
Add tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2dd507c1f98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.