# Issue

**Title:** [FIX] np.nanmean in func consensus when no boot

## Description

Changed np.mean() to np.nanmean() in func_consensus() function, when the consensus matrix is computed without any bootstrap.

This change is useful for a few cases where an individual subject has no BOLD signal data for an individual node (0s at every time point). When this happen, you don't want to completely ignore the subject, but you want to ignore the NaN correlations that np.corrcoef will return for pairwise correlations with this node. 

Example: Subject 39, node 113 in func_scale500.npy file

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `519ffc79b722`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.