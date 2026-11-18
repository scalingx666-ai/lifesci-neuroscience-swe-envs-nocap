# Issue

**Title:** FIX: More flexible ssp_ecg_channel

## Description

No need for changelog update since this `dict` support was in this release. We allow `None` to mean "use the MNE default", it should be allowed to be one of the `dict` values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18af7ca2d45c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.