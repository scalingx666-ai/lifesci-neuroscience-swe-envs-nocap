# Issue

**Title:** [DOC] - Update / extend documentation

## Description

Includes the addition of new documentation materials:
- new section in the examples for customizing fit approaches, including:
    - new example: custom metrics
    - new example: custom fit modes

Additionally, includes the following updates to existing documentation materials:
- update AP fit tut to include doublexp
- update the API list to include sub-objects of the model object
- update the FAQ
- minor fixes across tutorials / examples

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b3989762b4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.