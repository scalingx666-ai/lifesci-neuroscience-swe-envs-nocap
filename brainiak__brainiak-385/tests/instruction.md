# Issue

**Title:** dev: Pin Python version in Conda build

## Description

Conda packages for our dependencies lag behind Python releases. This
causes problems with Travis, e.g.:
https://travis-ci.org/brainiak/brainiak/jobs/435150784

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9889b80b4555`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.