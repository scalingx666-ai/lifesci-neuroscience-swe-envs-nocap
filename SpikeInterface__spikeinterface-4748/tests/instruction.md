# Issue

**Title:** Fix PCA metric recomputation when "soft" merging

## Description

Soft merges and splits recompute quality metrics only for newly created units. Previously, this subset was also used as the complete PCA comparison population. Consequently, merged units could not see neighboring unchanged units, producing incorrect "No other units found" warnings and invalid or fallback PCA metrics.

Keep the recomputation targets limited to new units, but use all analyzer units
for PCA projections, neighbor selection, spike counts, and firing rates.

Done with help from copilot, seems reasonable, results seems fine

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32bcb0dca9f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.