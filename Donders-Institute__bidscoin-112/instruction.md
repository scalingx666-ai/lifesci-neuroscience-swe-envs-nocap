# Issue

**Title:** Simplified the singularity definition.

## Description

I simplified the definition file and did minor changes in the documentation.

The current definition file is for BIDScoin without extra plugins. Shall we do something about it? I'm not using other plugins. I can help but it would be great to have some tests. And about that, `bidscoin -t` is in the documentation but not implemented.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5111cd9c1b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.