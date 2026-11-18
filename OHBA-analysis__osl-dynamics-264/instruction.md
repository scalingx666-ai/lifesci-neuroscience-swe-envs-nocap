# Issue

**Title:** Option to average over time in loss + removed S/MAGE

## Description

Closes 

Changes:
- Added a new argument to the config and layers to allow the user to specify whether to take the mean or sum over time in the loss.
- Deleted SAGE/MAGE.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f357b0344af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.