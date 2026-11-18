# Issue

**Title:** BF: `_on_mouse` and `_on_scroll` in viewers for non RAS matrices

## Description

I have corrected indices for matrices with flipped dimensions. 
I have also corrected the ordering of RAS dimensions when order of the RAS are different in the data array. 
Perhaps all the code need to be refactored for clarity, using only affine transforms from the viewer to the RAS coordinate system then RAS to ijk, avoiding confusing flipping and reordering. 
Perhaps I will look about that, if I have time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83eaf0b55be9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.