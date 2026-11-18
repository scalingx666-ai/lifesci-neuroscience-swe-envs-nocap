# Issue

**Title:** NaN typo in swarmsplitter.py (Numpy)

## Description

the line 96:
score = np.NaN
has trouble with the new Numpy version
changed to
score = np.nan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `008ef8f51e18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.