# Issue

**Title:** BUG: KellyKapowski smoothing usage said mm but was voxel units

## Description

The option `-l` was said to be "the Gaussian smoothing of the hit and total images.  Default = 1.0 mm.", but it was actually used in two places.

It was used as gradient smoothing sigma, in mm, and then as the total / hit smoothing *variance* in voxels^2.

Fix by adding a parameter `-j` to set the gradient smoothing sigma, in mm, and setting `-l` to be in mm^2, not voxel units.

BUG: Convergence reporting overflowed due to float typing

This was identified by Codex. It doesn't affect typical usage (fixed iterations).

- Used double energy accumulators and itk::SizeValueType counters to prevent loss of integer precision during convergence reporting.
- Added zero-count guards before normalization.
- Updated help text and diagnostic output.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be9a9c493956`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.