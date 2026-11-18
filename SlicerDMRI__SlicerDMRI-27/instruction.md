# Issue

**Title:** ENH: fix #26, improve #21 (baseline selection, and replace VTK filters)

## Description

Fixes  by selecting
baseline images using a threshold on the B-values rather than gradient
magnitude. Provides command line option to select threshold if needed
(default 100).

Prior to the change in [1], all images were potentially included in the mask
calculation because gradient components were rounded down
to zero [2]. After [1], some datasets are rejected because the 1e-6
tolerance criteria excludes low (non-zero) B-value volumes. For example,
in the issue #26 dataset, the baseline volumes have B-value 5.

[1]
[2] http://www.na-mic.org/Bug/view.php?id=3855

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `053709c83a37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.