# Issue

**Title:** MRG: Fix imsave

## Description

.

@mwaskom I used your approach but left the figure-generation private for now. Feel free to make a follow-up PR to make it public with proper documentation, etc.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9570efbd9d74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.