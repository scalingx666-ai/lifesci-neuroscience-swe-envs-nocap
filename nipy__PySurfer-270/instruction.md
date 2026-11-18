# Issue

**Title:** MAINT: Update fsaverage

## Description

In MNE we recently introduced a `fsaverage` dataset fetcher. Might as well use it here. It should help with #269.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b0d631d93b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.