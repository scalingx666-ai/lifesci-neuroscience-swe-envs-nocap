# Issue

**Title:** Minor changes

## Description

Some changes to how animations are made so they can be displayed inline on jupyter notebooks.

Trajectory animation supports accepting additional second-plotting function in instances where you want to draw something on top of trajectory animation.

Big fix for egoBVCs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec84ef08fb7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.