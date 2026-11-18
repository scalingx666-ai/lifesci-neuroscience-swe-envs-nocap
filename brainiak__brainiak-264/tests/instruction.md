# Issue

**Title:** small fixes after Hackathon at UT Austin

## Description

1. change process_num default value to be more conservative; 
2. add notes for possible Python multiprocessing error (happened on Lonestar5 of TACC)
3. fix a bug in the Python version of correlation normalization

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a6ecfdb1759`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.