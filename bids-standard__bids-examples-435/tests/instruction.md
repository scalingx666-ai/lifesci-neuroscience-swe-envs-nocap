# Issue

**Title:** Add "master-deno" flavor of validator to use as well

## Description

Sits on top of #434 to have it correct here. Relevant to this PR changes are only to workflow

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47c4da17bb54`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.