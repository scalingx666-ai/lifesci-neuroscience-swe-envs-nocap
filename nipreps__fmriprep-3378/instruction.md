# Issue

**Title:** RF: Upgrade nitransforms and remove workarounds

## Description

I've manually verified that `load_ants_h5()` can be replaced with `nitransforms.manip.load()` and that this does the right thing, and that using `nitransforms.apply(xfm, moving, target)` does indeed get me basically the same thing as ANTs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e6eadc83c66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.