# Issue

**Title:** [WIP] Imageio

## Description

Picking up an old suggestion from @Eric89GXL this uses [imageio](http://imageio.readthedocs.io/en/latest/index.html) for saving movies. Imageio downlaods and manages the FFMPEG binary automatically so this would provide considerable simplification.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40621da65585`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.