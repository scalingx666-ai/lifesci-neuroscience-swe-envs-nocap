# Issue

**Title:** Cleaning of the interface and updating the README

## Description

Using an enum for the EMG mode so people don't need to remember the difference between 0x01, 0x02 and 0x03.
Changing the class name from MyoRaw to Myo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca766a1b93be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.