# Issue

**Title:** ENH: Add option to smooth to nearest

## Description

Allows doing `smoothing_steps='nearest'` so you can see the patches of cortex like (not the most relevant example but gives the idea):

![Screenshot from 2019-09-24 12-26-44](https://user-images.githubusercontent.com/2365790/65531142-39238c80-dec7-11e9-807c-bbd55d0d1f94.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9cd751178d1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.