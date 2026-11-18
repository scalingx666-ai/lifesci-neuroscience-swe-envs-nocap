# Issue

**Title:** Update mne-stable and mne-prev-stable in CI

## Description

macOS tests are currently failing likely because MNE-Python is outdated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58010824fcde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.