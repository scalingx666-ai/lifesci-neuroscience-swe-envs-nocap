# Issue

**Title:** Fix input dimension errors in fractional occupancy and switching rate computation

## Description

When the state time course is 3d numpy array, `fractional_occupancies()` and `switching_rates()` did not handle its dimension properly. This commit corrects these bugs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89c0e299388c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.