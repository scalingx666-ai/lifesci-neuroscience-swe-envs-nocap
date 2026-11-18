# Issue

**Title:** FIX - denorm and roi processing >1 inputs

## Description

This PR fixes and completes the implementation of processing more than one input stream for modules
- `aamod_denorm` and derivatives
- `aamod_roi_extract`  and derivatives
- `aamod_roi_valid`  and derivatives

It also adds a new option for `aamod_roi_valid` to validate while keeping all participants, which ends up ROIdata consistent across all participants.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a42eb3cb5d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.