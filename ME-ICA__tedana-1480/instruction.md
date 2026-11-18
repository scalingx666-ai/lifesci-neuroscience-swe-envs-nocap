# Issue

**Title:** Reorder layers in adaptive mask plot

## Description

Closes none, but spins off a small bugfix from #1478.

Changes proposed in this pull request:

- Reverse order of mask lines in `plot_adaptive_mask` so that initial mask is on the bottom and the classification mask is on the top.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd18a6628dd4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.