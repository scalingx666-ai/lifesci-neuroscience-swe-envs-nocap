# Issue

**Title:** Make save folders year first by default.

## Description

Changed default date formatting of utils.save_figure() to be year first ("%y_%m_%d") instead of day first ("%d_%m_%y").
Day first can be used by called save_figure() with `year_first=False`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da09b44134ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.