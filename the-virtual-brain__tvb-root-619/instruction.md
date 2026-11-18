# Issue

**Title:** TVB-3039 Distribution fixes

## Description

- fix serialization to JSON in viewers for labels read directly from H5
- fix `scikit-learn<=1.1.2` version due to problems in Windows distribution
- hide `SiibraCreator` due to KG query v3 problem

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61c43e56e68b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.