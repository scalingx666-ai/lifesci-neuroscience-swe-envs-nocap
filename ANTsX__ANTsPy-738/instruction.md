# Issue

**Title:** ENH: Throw exception if image cannot be read

## Description

Non-existent files are caught but empty / bad files caused a seg fault

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f079ba6622f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.