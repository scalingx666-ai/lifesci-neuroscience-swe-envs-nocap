# Issue

**Title:** [MAINT] update dataset listing

## Description

- add new datasets to listing
- mostly dummy entries to pacify crashes on the website side

a cleaner fix would probably require updating pybids config to handle things introduce in new BEPs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5d03eef070b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.