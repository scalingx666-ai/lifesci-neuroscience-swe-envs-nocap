# Issue

**Title:** searchlight: Fix radius region mask check

## Description

Currently, for incomplete blocks at the end of axes with edges smaller
than the max block edge, the code includes the radius region in the mask
check when creating blocks. Instead, we check the actual region of the
block, which is smaller for incomplete blocks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f955b1f5966`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.