# Issue

**Title:** FIX: add dcm2niix build options for jpeg2000 support in singularity definition.

## Description

This fixes the error `unsupported transfer syntax` of `dcm2niix`.

See https://neurostars.org/t/unsupported-transfer-syntex-when-using-dcm2niix/6089/2.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4190e1be54a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.