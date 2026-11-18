# Issue

**Title:** Allow specifying `threshold_abs` and `threshold_rel`. This fixes the drop-everything-under-zero bug in ExaSPIM

## Description

Allow specifying `threshold_abs` and `threshold_rel`. This fixes the drop-everything-under-zero bug in ExaSPIM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61e43ff68dff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.