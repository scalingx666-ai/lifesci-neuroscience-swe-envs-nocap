# Issue

**Title:** Local repository

## Description

Hello @dickscheid and @AhmetNSimsek  -  for my usecase it would make sense to access local data directly with the custom configs. It was surprisingly easy to achieve with exposing the existing `LocalFileRepository`.

What do you think?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f9eedce7748`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.