# Issue

**Title:** FIX: set fast bias_iters parameter to 0

## Description

This adds a new fsl interface module, which contains a patch for nipype's fast interface. The nipype interface requires bias_iters to be `1 <= integer <= 10`, but setting `bias_iters=0` is required to bypass bias field correction.

The patched interface is dropped into the anatomical workflow and the parameters are accordingly updated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46ba7446574f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.