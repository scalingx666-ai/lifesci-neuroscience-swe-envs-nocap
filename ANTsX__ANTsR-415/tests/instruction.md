# Issue

**Title:** ENH: identity init transform for "deformable only" reg

## Description

Don't use initial COM alignment if the user is not doing linear registration

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e97374027a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.