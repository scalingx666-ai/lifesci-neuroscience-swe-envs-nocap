# Issue

**Title:** Add `space-fsaverage` to `sphere_reg` output files

## Description

This stems from 

Changes proposed:

- Add `space-fsaverage` to the filenames of sphere files registering fsnative to fsaverage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c361b3acc7d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.