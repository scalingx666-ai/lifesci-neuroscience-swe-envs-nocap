# Issue

**Title:** BRAINSDeface Update (independent mask generation & application)

## Description

This PR adds two flags that breaks BRAINSDeface into two phases that can be run independently. Phase one is mask generation, and phase two is mask application.

The two flags are:
- `--noMaskApplication` which will generate the mask but not apply it to the images that were used to generate the mask.
- `--inputMask` which is an input mask (skips mask generation)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96afc58e714c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.