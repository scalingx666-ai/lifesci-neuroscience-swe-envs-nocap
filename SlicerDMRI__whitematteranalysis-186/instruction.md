# Issue

**Title:** ENH: Test with code coverage in GHA package test workflow

## Description

Test with code coverage in GHA package test workflow.

Move the coverage reporting block in the workflow file closer to the testing with coverage block.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7df98fefedb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.