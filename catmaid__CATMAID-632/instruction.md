# Issue

**Title:** Dataview performance improvements

## Description

These are some small spare time changes to improve the performance of CATMAID's data views. This is probably only noticeable with large setups with many projects, stacks and tags. The penalty for smaller setups should be negligible. So @fzadow, could you please test if this helps on your setup?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9a8dc6e0350`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.