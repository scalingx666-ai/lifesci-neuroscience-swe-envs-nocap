# Issue

**Title:** FIX: Pass sphere_reg_fsLR to ds_reg_fsLR

## Description

Woops. Thanks to @shotgunosine for noticing that the outputs looked suspiciously similar.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f78fa24a92e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.