# Issue

**Title:** Fix: asymmetric colour bar in power.save

## Description

Changes:
- The option to have an asymmetric colour bar was not available if when saving power maps to file.
- If you have multiple power maps you would like to save then you should handle the min-max renormalisation separately for each of them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28758bb795b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.