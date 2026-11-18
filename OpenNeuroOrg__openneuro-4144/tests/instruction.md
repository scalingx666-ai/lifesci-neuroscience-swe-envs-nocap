# Issue

**Title:** Upgrade bids-mosaic to v0.3.1

## Description

This is intended to reduce redis timeout errors when creating mosaics. See more about bids-mosaic v0.3.1: https://github.com/jbwexler/bids-mosaic/releases/tag/v0.3.1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b42d4f161451`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.