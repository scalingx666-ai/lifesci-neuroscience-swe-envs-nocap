# Issue

**Title:** TVB-3049: Add constraints for non admin project members

## Description

- members can no longer edit project name of which they are not admin
- members can no longer delete projects of which they are not admin
- members have option to leave a project

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34e6450b0383`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.