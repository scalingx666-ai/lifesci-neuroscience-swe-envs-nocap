# Issue

**Title:** Efficiency Improvements + Protect Data Temp Directory

## Description

Closes 

Changes:
- Improved efficiency of model initialisation.
- Made `random_state_time_course_initialization` more robust.
- Made temp directories for the Data object only readable by the user that created them.
- Updated fMRI examples.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8ed6aeede84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.