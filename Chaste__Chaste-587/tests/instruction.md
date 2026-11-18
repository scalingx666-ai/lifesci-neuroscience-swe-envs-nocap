# Issue

**Title:** Speed up memtest ci by running continuous test pack across multiple runners

## Description

Split up the memory testing into `[cell_based, heart, crypt, lung, core]` and combine the results at the end. This should reduce runtime substantially.

Note that I've cherrypicked some commits from #581 as part of this work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c9ed6394efb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.