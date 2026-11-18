# Issue

**Title:** [FIX] fix bug in resampling.py when src and trg are in MNI152

## Description

In `resampling.resample_images` we were checking if `src` and `src` are in MNI152 space; it's now fixed and checks if `src` and `trg` are in MNI152 space. This PR was prompted by issue #89 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfe44bdcfb08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.