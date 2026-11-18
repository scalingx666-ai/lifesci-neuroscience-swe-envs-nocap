# Issue

**Title:** BUG: fix paste error from R, arg is type_of_transform

## Description

A couple of places had the wrong name for the `type_of_transform` parameter to ants.registration.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eaaf59e47bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.