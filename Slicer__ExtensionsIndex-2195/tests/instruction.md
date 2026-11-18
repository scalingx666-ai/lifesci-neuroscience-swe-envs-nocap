# Issue

**Title:** Update MorphoDepot.json - pin version

## Description

Allow testing and fixes to continue on main branch.

Since we are using the Slicer Preview releases in production due to the need for Terminology changes, we should treat this version as stable for now and not get untested changes into the published extension.

This is needed since I pushed a few commits to MorphoDepot main branch before realizing that if they have any issues they could disrupt current users.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86803a999f77`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.