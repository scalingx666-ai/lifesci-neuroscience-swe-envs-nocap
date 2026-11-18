# Issue

**Title:** GLM fix to run tcca without ss

## Description

Issue: GLM skips tCCA regression when there is no ss channels even though there is Aux. Now this is fixed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f55e5c8f88ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.