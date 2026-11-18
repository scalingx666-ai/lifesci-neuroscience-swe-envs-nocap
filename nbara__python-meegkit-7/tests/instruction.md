# Issue

**Title:** fixed issue with cosine blending

## Description

There was a mistake with the brackets (in line 614 of asr.py), it should be fixed now

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ce30b7e1d87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.