# Issue

**Title:** [FIX] Fix order of hemispheres in beliveau and norgaard fsaverage maps

## Description

I swapped the order for right and left annotation information in the osf.json file for beliveau2017 and norgaard2021 fsaverage maps. This does not change any data, it just changes the order in which R and L are fetched using neuromaps functionality. Now, when these maps are fetched, tuples will be ordered (L, R) instead of (R, L).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d8fed594ecf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.