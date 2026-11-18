# Issue

**Title:** Improve Visualization Process Interaction

## Description

This makes better use of QProcess class to improve tracking of the external visualization process.

**Summary**

* A running visualization is now closed if neuromore Studio is closed.
* Prevents starting a second visualization if one is running already
* Does not open the visualization selection popup if one is running already
* Closes a running visualization if Layout is switched to "Experience Selection" (and `STUDIO_SETTING_EasyWorkflow` is set for the current user)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7d09baf882f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.