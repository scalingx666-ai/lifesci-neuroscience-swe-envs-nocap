# Issue

**Title:** Minor: add .gitignore to hdf5 directory

## Description

I doubt there are many people simultaneously working with hdf5 files and developing CATMAID, but I'm one and seeing red in my `git status`/ remembering not to add 20GB binary files to git tracking is getting annoying.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d5469153391`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.