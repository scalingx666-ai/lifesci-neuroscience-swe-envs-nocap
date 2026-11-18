# Issue

**Title:** Allow loading of .h5 DLC data files, enabled file name matching

## Description

This commit makes minor edits to the 'alignment' function, to enable loading of .h5 files from DLC. This is helpful since DLC now does not save as .csv by default. This commit also prevents having to rename the DLC output files (e.g. removing the suffix DLC_resnet50_task_date_shuffle_iterations), and instead uses glob to match video file names to data files.

I've checked that data is loaded/aligned identically to the previous behavior... Please let me know if you'd like me to run any other tests etc.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3681e067cbb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.