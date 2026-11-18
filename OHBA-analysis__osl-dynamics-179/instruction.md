# Issue

**Title:** Feat: Learning rate decay.

## Description

We can now set the learning rate decay rate in `config` or specify it in `model.fit()`.

This PR only adds this feature to the DyNeMo-related models.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22587f7171fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.