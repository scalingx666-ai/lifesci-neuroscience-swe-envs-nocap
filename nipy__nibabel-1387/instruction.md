# Issue

**Title:** BF+TST: Fix 'frame_order' for single frame files

## Description

The `_frame_indices` attribute on the `MultiframeWrapper` was empty for single frame files, causing use of the `frame_order` property to raise an exception.

Also, don't assume StackID is int (it is a str), don't assume DimensionIndexValues has more than one value. Fix how we assign multiple values to DimensionIndexValues when making fake test data (need to pass list instead of tuple).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9c479a03df4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.