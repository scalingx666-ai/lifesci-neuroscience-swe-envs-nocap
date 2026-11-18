# Issue

**Title:** Added frames_per_file field to tiff_to_binary

## Description

This field preserves the functionality of the frames_per_folder field even when not using the look_one_level_down flag. Currently I've only added this to tiff_to_binary (as that's all we use) but it could be added to the other x_to_binary functions if they handle files in the same way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67b12db602b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.