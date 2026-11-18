# Issue

**Title:** WIP: Use bayesian network

## Description

@patrick-mcclure still has some testing of the Bayesian network code to do but has added in validation code (with testing), and changed the default normalizer to none in nobrainer.predict.predict.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `549cf8bd9566`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.