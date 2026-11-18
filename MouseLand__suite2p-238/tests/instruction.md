# Issue

**Title:** Fixed bug when empty cells are in sourcery/get_stat

## Description

suite2p was throwing an error in get_stat when some ROIs contain no pixels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e57f535d207`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.