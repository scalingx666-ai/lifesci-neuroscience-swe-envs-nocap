# Issue

**Title:** Single-Channel DyNeMo

## Description

Changes:
- Added a new model for training DyNeMo on 'single-channel' (time-delay embedded; TDE) data: SC-DyNeMo.
- SC-DyNeMo parameterises the TDE mode covariances assuming a stochastic oscillator model.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `480e0d78f47a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.