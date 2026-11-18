# Issue

**Title:** use custom extra regressors in matlab models C and D

## Description

Previously, user-designed extra regressors were ignored in models C and D in the matlab implementation. This change includes them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `082851f9db87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.