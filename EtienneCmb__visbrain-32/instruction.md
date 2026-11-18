# Issue

**Title:** Changed file loading errors

## Description

Smaller patches for file selection:

1) JSON is standard to save a GUI config. This should also be standard when loading a GUI config (or at least selectable).
2) Standard file pattern for loading EEG data includes now all EEG files. Else the user has to select his specific format each time he starts sleep.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6122f8e8e2f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.