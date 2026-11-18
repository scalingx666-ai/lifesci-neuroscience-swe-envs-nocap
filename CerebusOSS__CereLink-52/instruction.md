# Issue

**Title:** Correct documentation of unit mapping in spike event packages

## Description

The documentation of the possible values of unit inside the cbPKT_SPK struct is outdated.

This patch fixes this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02d64fc5a6f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.