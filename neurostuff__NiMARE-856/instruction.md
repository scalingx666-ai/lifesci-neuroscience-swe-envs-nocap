# Issue

**Title:** Disable computation of probabilities by default for MKDAChi2

## Description

- Makes `prior` argument in `MKDAChi2` optional, and only computes posterior probabilities based on prior if given
- Renames outputs to match Neurosynth.org (consistency -> uniformity; specificity -> association)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e10f034f760`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.