# Issue

**Title:** Simplified DyNeMo

## Description

Changes:
- Added new model: Simplified DyNeMo, which has the following advantages:
  - No more KL loss, which means we can avoid the KL loss `nan` error that sometimes occurs with normal DyNeMo.
  - This model appears to converge quicker.
  - This model is quicker to train.
- Added an example script.
- Modified State-DyNeMo to the new simplified approach.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ae2a69f5b94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.