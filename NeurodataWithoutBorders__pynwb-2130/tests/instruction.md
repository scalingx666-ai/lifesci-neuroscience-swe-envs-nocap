# Issue

**Title:** NWBHDF5IO: Don't check path if it is None

## Description

We only need to check if the given path ends in .nwb if it is not None.

Close #2125

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `387f80bd621d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.