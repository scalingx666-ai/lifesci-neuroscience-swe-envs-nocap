# Issue

**Title:** Fix MacOS Qt deployment

## Description

Calculate the MacOS bundle path only once, copy liblsl for Qt-apps, fix the macdeployqt call and show the output in case of an error.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `406b5de4f35f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.