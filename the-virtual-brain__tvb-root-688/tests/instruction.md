# Issue

**Title:** Work on fixing builds

## Description

- temporary disable tests run on INS machine @maedoc - do you see things differently ?
  - library tests are still run part of the `build.yml` flow on python 3.8, 3.9, and 3.10
- pin allensdk version
- avoid large memory consumption notebook to run, or it will fail CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5bae8a37f7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.