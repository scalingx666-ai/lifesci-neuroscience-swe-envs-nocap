# Issue

**Title:** Made device tensor accessable as host Numpy array in utils/monitor.py

## Description

There was a line in utils/monitor.py that was trying to access a device tensor. I made a simple change to a version of the tensor that is usable on the host as a numpy array.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6cabeaac916`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.