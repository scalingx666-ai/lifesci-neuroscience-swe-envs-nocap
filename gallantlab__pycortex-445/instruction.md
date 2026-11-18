# Issue

**Title:** FIX random crashes in `save_3d_views`

## Description

I realized that after calling `getImage`, sometimes the view was not rendered. I believe this is what caused the random crashes with `save_3d_views`. Forcing the view to be drawn again after `getImage` solves the random crashes. (Or at least, I've been running `cortex.export.plot_panels` for ~20 times in a loop and it hasn't crashed...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ae5f2595ca5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.