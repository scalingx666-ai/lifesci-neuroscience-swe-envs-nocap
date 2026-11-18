# Issue

**Title:** FIX: Dealing with testing mayavi backend

## Description

When setting `mlab.options.backend = 'test'` for some mne-python testing, I ran into an issue with PySurfer setting a parameter that doesn't exist for the Null renderer that's used in that mode. This fixes that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b76a2a66cc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.