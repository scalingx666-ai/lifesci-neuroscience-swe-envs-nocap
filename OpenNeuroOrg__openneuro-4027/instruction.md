# Issue

**Title:** fix(server): Increase json payload limit to 200mb

## Description

Occasionally the 100mb limit is exceeded by validation output even with the 50k issues limit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d3b314c10fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.