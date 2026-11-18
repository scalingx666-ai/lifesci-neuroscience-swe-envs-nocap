# Issue

**Title:** [REF] Fix OSF json and funcs

## Description

Migrates some of the annotations to the public OSF repo, fixed the OSF json, and some light modifications to the `datasets._osf` functionality to make updating the json easier in the future.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9220ede52191`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.