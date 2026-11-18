# Issue

**Title:** perf: ensure sequential access during envelope computation

## Description

Happy new year! On a field of ones sized 512x512x512, this shaves about 10-20%

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e43f62e75fd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.