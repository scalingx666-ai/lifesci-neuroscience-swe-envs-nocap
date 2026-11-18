# Issue

**Title:** FIX: new_image_like arg typo

## Description

The `new_image_like` function had a typo where the argument was name "self" because it was originally attached to the ants image class. Now it is an `@image_method` function. This PR fixes that and also adds a semi-alias function `from_numpy_like` that fit in better with the api given the `from_numpy` function... except the args are switched.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0ffa49137db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.