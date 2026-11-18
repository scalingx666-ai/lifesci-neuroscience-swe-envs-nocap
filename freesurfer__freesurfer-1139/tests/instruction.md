# Issue

**Title:** bf: fix erroneous activations in cortex and brainstem

## Description

Merging in changes which fix the binary operations used to cleanup the final activations. The operations include connected component analysis and smoothing of the external boundary. These were missed in the original port from the development environment used for the paper results. 

Some additional small changes are made to the save location of the realigned source data, to be consistent with the Bayesian tool, as well as the addition of an example freeview command for visualisation of the results.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ad5b23f822f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.