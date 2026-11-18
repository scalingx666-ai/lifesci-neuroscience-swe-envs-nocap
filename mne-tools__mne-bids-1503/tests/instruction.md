# Issue

**Title:** Improve read BIDS example

## Description

I just followed along the example and found some opportunities to improve it. Most importantly, the MNE sample dataset (1.5GB) was downloaded although it was never used/needed here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bc99c520fea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.