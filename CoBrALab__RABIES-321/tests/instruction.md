# Issue

**Title:** After smoothing, the image is divided by the smoothed mask to correct…

## Description

… for edge effects, and the mask is applied to remove values outside the brain.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bd3803e1941`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.