# Issue

**Title:** Save memory in parcel analysis

## Description

This hopefully fixes

The way I had implemented the `_gaussian_energy` routine in parcel analysis was actually quite stupid as I was not exploiting kernel separability, and was therefore requesting quite a lot of memory, occasionally triggering memory errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b765f258621c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.