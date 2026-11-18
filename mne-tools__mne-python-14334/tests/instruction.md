# Issue

**Title:** Add periodic sponsors check

## Description

(assisted by GPT-5.6 Terra). This workflow runs three times a year (06:17 UTC on 1 February, June, and October), but it can also be manually dispatched. After merging, we can manually dispatch it to see what the created issue looks like and if everything works (I can't think of a clean way to test it before).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f7c06df9360`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.