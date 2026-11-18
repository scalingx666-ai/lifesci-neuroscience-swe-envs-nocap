# Issue

**Title:** Add alpha sampling for State-DyNeMo

## Description

This pull request introduces the functionality to sample alpha from the model RNN in the State-DyNeMo model. The implementation follows the approach used in the `sample_alpha` function from `model/dynemo.py` to ensure consistent behaviour across both DyNeMo and State-DyNeMo models.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `065cc663ccec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.