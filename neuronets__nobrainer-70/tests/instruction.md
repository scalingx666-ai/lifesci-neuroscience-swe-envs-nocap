# Issue

**Title:** Fixes for tensorflow 2.0.0rc0

## Description

This mostly affects the conversion from nifti to tfrecords.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7de026495442`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.