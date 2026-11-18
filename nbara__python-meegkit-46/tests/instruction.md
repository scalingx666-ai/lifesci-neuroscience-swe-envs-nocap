# Issue

**Title:** [FIX] Use linalg.eigh in RESS

## Description

This replaces `linalg.eig` with `linalg.eigh` in the RESS code (as it provides slightly better results and the symmetry assumption for `eigh` is valid with covariance matrices)

Had to use a tiny bit of shrinkage to the covariance to avoid numerical precision issues in the GED.

Thanks @mikexcohen for the suggestion.

Linking this cool new preprint here as well:
https://arxiv.org/abs/2104.12356

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2fe945acf16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.