# Issue

**Title:** MRG: Fix for loss of revcmap in Matplotlib 3.4

## Description

Matplotlib removed the `revcmap` function in 3.4, just released.

Rewrite using the `reversed` method of the colormap.

I'd love a review here.  Is there anyone out there who uses `labs.viz` that can
test this?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed10a086fb7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.