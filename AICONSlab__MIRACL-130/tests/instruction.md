# Issue

**Title:** Small fixes for ace docs

## Description

Items completed
- Swap ACE single subject and ACE stats commands that were in the wrong spots
- Add explanation that docker is mounting `miracl/` by default
- Change the example code to contain only full-length flags
- Change the batch size for ACE example code
- Add explicit GPU flag on the installation page
- Change sample data download to HuggingFace

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7b6cd1571527`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.