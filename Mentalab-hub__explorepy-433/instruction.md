# Issue

**Title:** Added exg_fs argument to get_data for CleanEEG

## Description

More proper solution would be to make CleanEEG an EEG packet, but this should also mean refactoring the EEG class imo, so this is shorter / easier.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a97a7ae36d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.