# Issue

**Title:** new python versions support update

## Description

CHANGE:

Changed async=True to background=True

CHECK:

Project works with python version up to 3.8.6 and MATLAB 2020b. Tested on Windows 10 1809

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8caef4a8020`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.