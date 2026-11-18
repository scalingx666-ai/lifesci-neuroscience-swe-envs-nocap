# Issue

**Title:** fix(server): Verify datacite status for public state changes

## Description

Fixes an issue where older DOIs would not be updated if they existed on datacite. Instead we check the datacite API for each snapshot and update then.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35f1e630a435`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.