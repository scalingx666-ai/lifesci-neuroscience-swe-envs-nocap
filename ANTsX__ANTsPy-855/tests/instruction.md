# Issue

**Title:** ENH: Read ITK metadata from image on disk

## Description

Working on a solution to #854

This allows us to read ITK image metadata using ImageIO. Thus we can get both qform and sform.

This could be used to make a function that lets one choose which transform to use on read.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f962d83fc66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.