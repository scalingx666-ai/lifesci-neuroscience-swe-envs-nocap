# Issue

**Title:** ENH: Add sphere registration to fit workflow, check for precomputed

## Description

Not much to say. Moved some of the surface conversion into first-order fit, even though they are easy to calculate post hoc because they are needed if msmsulc is used. Initially tried to make some of it conditional, but it made it annoying to construct the complement after the fact. A few extra surfaces in the anatomical derivatives are not our biggest problems, space-wise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6b842f86462`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.