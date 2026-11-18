# Issue

**Title:** FIX: import specific `skimage` modules

## Description

fixes 

import `skimage.measure` and `skimage.transform` explicitly instead of only `skimage`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b14cd7ade86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.