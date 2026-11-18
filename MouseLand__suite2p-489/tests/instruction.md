# Issue

**Title:** Refactoring changes to extraction.dncv without classify commits

## Description

This PR contains refactoring commits in #486. 
In addition, this PR also addresses the following concerns regarding #486:

- removes classification commits
- adds keyword arguments to oasis/preprocess calls

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eaeddbb6cd32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.