# Issue

**Title:** [ENH] Error when affinity matrix contains nan/inf

## Description

Currently, if the affinity matrix contains Infs/NaNs then it's used in dimensionality reduction anyway, which results in gradients that are all NaNs. It's not intuitive for the user what's going wrong here.

This PR adds an error in `brainspace.gradient.gradient._fit_one` when the affinity matrix contains Infs/NaNs in. It also removes an unused import in the same file. 

-  .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34835e190d32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.