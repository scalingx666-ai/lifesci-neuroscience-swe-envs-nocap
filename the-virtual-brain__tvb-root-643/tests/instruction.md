# Issue

**Title:** TVB-3067 Profile cleanup

## Description

Add extra TRY on Env.is_distribution call, to avoid accidental installations of TVB_BIN

Get rid of EXTERNALS_FOLDER_PARENT property.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45c2a74bdad1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.