# Issue

**Title:** [MAINT] build images and run tests

## Description

- build a dev image in addition to production image
- fix testing suite
- update requirements (NiMARE and related torch requirements that were not necessary)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `356bf6cf33ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.