# Issue

**Title:** feat!: Allow Parallel Port devices to be managed by Device Manager

## Description

Breaking change as people using the Parallel Out Component now need to define a device in order to specify an address, also LabJack had to be moved to its own Component ().

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc93a8b6e41e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.