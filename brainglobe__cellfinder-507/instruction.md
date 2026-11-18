# Issue

**Title:** Improve printing & logging

## Description

This PR standardizes logging across the Cellfinder API and Napari plugin by replacing print() statements with the pre-configured logger from cellfinder.core. #424  This ensures:
✅ Consistent logging format across the project
✅ Improved debugging with log levels (INFO, WARNING, ERROR)
✅ Better control over log outputs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab0e22e15fa9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.