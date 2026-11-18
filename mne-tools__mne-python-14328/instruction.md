# Issue

**Title:** Tweak CI triggers

## Description

I noticed on a recent PR that adding a label triggered `autofix`, which is wasteful. Let's clean that up, along with several other small CI things (including getting rid of `autopush`, which we shouldn't need now that CircleCI allows builds from anyone).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `983a123b478a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.