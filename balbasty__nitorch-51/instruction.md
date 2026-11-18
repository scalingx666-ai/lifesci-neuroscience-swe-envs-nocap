# Issue

**Title:** Refactor augment

## Description

This PR adds a spline-based generator for smooth random fields, which is much more efficient than the convolution-based one (and doesn't fail with large FWHMs). I now use it to sample bias fields and velocities.

I use better defaults for spatial augmentation (based on the ones found by @brudfors). Looks reasonable without being too conservative.

I added functions to generate random smooth label maps (can be used to do something like this: https://arxiv.org/abs/2004.10282)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80d92d7aff82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.