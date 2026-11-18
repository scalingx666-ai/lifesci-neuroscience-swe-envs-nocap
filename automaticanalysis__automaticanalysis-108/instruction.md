# Issue

**Title:** volumes2movie: replaced depreciated movie2avi with writeVideo

## Description

Here's a small change to a file in extrafunctions, mostly to try out as my first pull-request but also because the code was using a depreciated Matlab function and was crashing on us.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48cae06afd9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.