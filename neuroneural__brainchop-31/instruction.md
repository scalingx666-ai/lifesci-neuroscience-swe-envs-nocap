# Issue

**Title:** Cc3d fix

## Description

The main change is purging tensorflow.js from the connected components code by replacing the 3 functions that depended on it with ones that do not.

I have also turned off cropping for the "flash filet" light model - the first entry in the menu. The model is unable to handle it

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55708e9616cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.