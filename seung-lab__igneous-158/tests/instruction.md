# Issue

**Title:** skeletonization when resolution is non-integer value

## Description

Part 2 of skeletonization, merging, failed when the resolution of the data is float. Fixed the issue and tested on one of our data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2eccf8082548`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.