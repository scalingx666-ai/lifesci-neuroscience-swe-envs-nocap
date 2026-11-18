# Issue

**Title:** FIX Brain.save_movie():  prevent greater than possible frame times

## Description

np.arange() sometimes returns values larger than `stop` due to floating
point round-off, which becomes relevant with large `time_dilation`
values.

I hope that's the last fix for determining movie times :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4edbe61e55b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.