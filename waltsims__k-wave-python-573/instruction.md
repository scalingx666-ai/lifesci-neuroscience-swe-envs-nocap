# Issue

**Title:** Refactor sharpness filters and improve single_sided_correction

## Description

Changes here:
* Simplified `single_sided_correction`'s implementation and added python-side unit tests. Updated to not return anything since input array is modified.
* Extracted sharpness filters to a separate class. In the future, we should convert `filters.py` to a module and categorize the filters under different files in the module.
* Added python-side unit tests to for the Brenner sharpness and simplified its implementation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18a566de43cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.