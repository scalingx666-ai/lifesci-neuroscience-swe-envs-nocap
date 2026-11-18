# Issue

**Title:** fix: pointset intersection with boundingbox fails if no points inside

## Description

The pointset - boundingbox on main raised an exception if no points were inside the bonding box.

This PR should fix the problem.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a53a92599a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.