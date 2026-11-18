# Issue

**Title:** [FIX] Consensus modularity returns int array

## Description

Previously the code for `consensus_modularity()` returned a float array for the community assignments, which is silly and also caused `plot_mod_heatmap()` to break. This PR fixes that issue!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22fa9d07c1dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.