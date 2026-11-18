# Issue

**Title:** FIX: correct off-by-one in Higuchi FD inner loop

## Description

The inner loop summed `j = 1 … N_m-1` (n_max-1 terms) instead of the correct `j = 1 … N_m` (n_max terms), dropping the last difference in each sub-series and slightly underestimating curve length.

Fix: `range(1, n_max)` → `range(1, n_max + 1)`

Also corrects the docstring formula (upper limit `N_m-1` → `N_m`) and updates all higuchi_fd docstring examples and the unit test expected value to match the corrected output.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7150019391e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.