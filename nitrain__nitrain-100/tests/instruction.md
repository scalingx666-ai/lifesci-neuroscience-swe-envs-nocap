# Issue

**Title:** CLR callback / LRScheduler improvement

## Description

Added Cyclical Learning Rate callback: original code can be found at: https://github.com/bckenstler/CLR/blob/master/clr_callback.py
Modified LRScheduler so that it returns current validation loss for learning rate adjustments. 
Other changes I used were from:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21507feb258a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.