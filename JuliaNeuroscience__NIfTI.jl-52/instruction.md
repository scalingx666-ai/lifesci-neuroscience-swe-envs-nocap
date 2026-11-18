# Issue

**Title:** Patch bump for #51

## Description

Also changed nidim to to_dim_i16 b/c it is slightly faster and preps for
NIfTI-v2 headers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eaad22f1e0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.