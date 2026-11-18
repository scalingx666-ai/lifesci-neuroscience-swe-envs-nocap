# Issue

**Title:** Feat: new method to select channels in the Data object.

## Description

Closes 

Note: the default mode in reading memory maps was changed to `c` to prevent us from modifying the 'raw' data memory maps.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4a4c5bc7a7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.