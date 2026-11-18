# Issue

**Title:** fix double .nii

## Description

some files are being uploaded with double .nii.nii.gz extensions, this should fix that issue.

example of problematic upload: https://neurovault.org/images/904290/

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1eb0aea4bc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.