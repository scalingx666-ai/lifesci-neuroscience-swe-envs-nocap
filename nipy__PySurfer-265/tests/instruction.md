# Issue

**Title:** MRG: width/height in offscreen mode

## Description

Fixes a bug from #245 that showed up when `w != h` as values ended up swapped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16e5ed218a9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.