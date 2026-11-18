# Issue

**Title:** MAINT: CircleCI housekeeping

## Description

Following what was implemented in fmriprep:

- Add Docker orb for easy authentication
- Bump machine images to latest LTS (focal)
- Remove setfacl calls

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0776ec98f299`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.