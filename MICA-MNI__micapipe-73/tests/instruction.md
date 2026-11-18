# Issue

**Title:** patch for aparc-a2009s and general robustness

## Description

This patch ensures only labels found in the label.csv files have calculated FC (eg. it doesn't require only sequential labels). This adds general robustness and fixes the issue with `aparc-a2009s` which starts at label 1000.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54ad38d4ead4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.