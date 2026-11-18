# Issue

**Title:** EBR-45 Review settings page flow

## Description

When TVB web starts for the first time, we expect the user choose TVB data folder to be empty (or not exist).
If the user clicks the button "Validate DB", then an empty db file gets created into the freshly chooses folder.
This DB file can be ignored in the flow of setup

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d25e475a839`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.