# Issue

**Title:** fix: weight edge attribute doesn't throw errors anymore

## Description

The edge attribute in the neuprint executor threw an error with the new JSON feature implementation. I also made the neuprint executor tests more rigorous.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `000370707a71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.