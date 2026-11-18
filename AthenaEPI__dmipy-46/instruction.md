# Issue

**Title:** Adds catch for fitting data without b0 measurements.

## Description

Addresses avoidable obscure numpy error when scheme without b0 measurements is used to fit data in issue #45.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db023da62000`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.