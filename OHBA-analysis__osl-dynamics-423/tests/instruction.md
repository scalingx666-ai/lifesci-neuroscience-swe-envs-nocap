# Issue

**Title:** HBN-EEG Source Reconstruction

## Description

Improvements to `osl_dynamics.meeg` for processing EEG data:
- Create osl directories when needed.
- Option to coregister a subject and re-use for multiple sessions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c16105382eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.