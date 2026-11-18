# Issue

**Title:** Fix bug with SciPy 1.18.0 EEGLAB reading

## Description

. Drafted with Claude Opus 5 and reviewed / iterated by me. Use a little fixture to cause files to be read by pymatreader and scipy in some tests, then use it to check the bug.

This one is pretty straightforward so self-marking for merge-when-green and marking for backport.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcdab879fcb4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.