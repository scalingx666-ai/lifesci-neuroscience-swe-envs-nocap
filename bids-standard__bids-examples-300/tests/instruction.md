# Issue

**Title:** [FIX] update pet datasets to 1.6 bids version

## Description

I have checked ALS, qMRI and PET datasets and only the PET ones needed a BIDS version bump to be coherent with when the specification supported that data type.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e8735b0e69b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.