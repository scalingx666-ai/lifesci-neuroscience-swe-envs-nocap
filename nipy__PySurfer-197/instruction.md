# Issue

**Title:** FIX Brain.set_data_time_index():  skip data without time axis

## Description

Fix for a corner case where multiple data layers are added, and not all of them have a time axis

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddb6f138998c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.