# Issue

**Title:** Fixed incorrect scaling of BVCs firingrates I#108.

## Description

.

Added a line when `self.cell_fr_norm` is initialized in the BVCs to unscale it using `self.min_fr` and `self.max_fr`.

BVCs now generate firingrates spanning the full range expected with `min_fr` and `max_fr`.

**Note:** The small overshoot above `max_fr` mentioned in the issue is not addressed here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e715cd6d9afe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.