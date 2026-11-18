# Issue

**Title:** Update happy.py | mem check for singularity containers

## Description

Running happy in singularity on a Linux cluster caused crashes despite ample allocated memory/cores. 

I sandboxed the .simg and rebulit locally to confirm that this fix works.

Changes proposed in this pull request:

- check if rapidtide is running in a singularity container
- if so, run `tide_util.findavailablemem()`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08eb4f7b0309`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.