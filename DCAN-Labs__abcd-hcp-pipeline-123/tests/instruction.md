# Issue

**Title:** anat-only ExecutiveSummary

## Description

Addresses  .

If input is anat-only or if " --ignore func" is used, then update session spec accordingly for compatibility with ExecutiveSummary.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d034c5c838a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.