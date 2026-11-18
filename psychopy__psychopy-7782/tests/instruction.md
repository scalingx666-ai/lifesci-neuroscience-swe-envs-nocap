# Issue

**Title:** RF: Move movie writing classes to `movietools` from `camera`

## Description

PR moves the movie writer classes from the camera module to movietools. They're general purpose for writing image frames to file asynchronously and can be used in other parts of PsychoPy without needing to import the camera module to access them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ede716972ed1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.