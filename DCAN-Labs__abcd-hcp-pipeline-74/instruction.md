# Issue

**Title:** add --dcmethod option

## Description

adds --dcmethod option based on infant-abcd-bids-pipeline. Use --dcmethod {TOPUP, FIELDMAP, NONE} to override default assignment of distortion correction method (which is done based on the contents of the input fmap dir)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f047e9cfc3ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.