# Issue

**Title:** BUG: Fix auto-complete effect preview not shown when views are not sh…

## Description

…own by default

The preview segmentation node of auto-complete effects (Fill between slices, Grow from seeds, Watershed) gets its display node from the scene's default display node. View node IDs are not copied from the default node, so if the default display node disables ShowInAllViewsByDefault the preview is shown in no view at all, and the opacity slider has no visible effect.

Copy ShowInAllViewsByDefault and the view node IDs of the input segmentation's display node to the preview's display node at each preview update, so the preview is shown in the same views as the input segmentation.

ref:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bbd1e2c758e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.