# Issue

**Title:** perf: lower memory skeletonization

## Description

Uses CloudVolume renumbered downloads to reduce the size of the u64 labels and more carefully manages its lifecycle.

This was necessary because the addition of aggressive hole filling and cross section analysis were increasing the memory requirements such that out of memory errors were occurring during cluster processing.

This run seems to give fairly impressive results (blue) old code (black) new code

<img width="1720" height="966" alt="image (8)" src="https://github.com/user-attachments/assets/92baa4a9-25d6-4759-bf82-8ae54f5ce43b" />

This run is more ambiguous. (blue) old code (black) new code (red) new code. 

At least the initial download shows a benefit in memory consumption.

<img width="1260" height="540" alt="Figure_1" src="https://github.com/user-attachments/assets/6fac43a2-65ca-4297-be50-4a125c3a9fb7" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8db3efc696f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.