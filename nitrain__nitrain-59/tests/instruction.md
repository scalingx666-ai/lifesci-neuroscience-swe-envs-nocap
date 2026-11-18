# Issue

**Title:** Changes math.inf to np.inf to keep py2 compatibility

## Description

math.inf was breaking in the callbacks.py so I changed it to the numpy equivalent, available both in py2 and py3

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `204c748fe7c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.