# Issue

**Title:** Fix sample floatingpoint offby1

## Description

I noticed that `save_movie()` was creating movies slightly shorter than the desired length -- a 6 second movie would become a 5.8 seconds movie, for instance.

I think this is primarily an issue in ffmpeg which would be almost impossible to solve, but I also noticed a minor floating point instability in the calculation of the number of samples in my data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `330cbe1aec70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.