# Issue

**Title:** Cor 5706: update unity example to support android

## Description

The change include:
- update android manifest because we do not need to custom unity player activity and make it as services
- update gradle and manifest to can support unity 2021 and above

Please help to review. Thanks

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb2cd9a7109e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.