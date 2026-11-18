# Issue

**Title:** Fugw loss on val features

## Description

Small changes to compute the fugw loss on validation features :

- Adds the ability to compute the loss at each BCD iteration on a validation set comprised of feature maps/anatomical kernels (or both);
- New unit tests;
- Warnings and error messages when lacking or incorrect data is passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d21bfab9799e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.