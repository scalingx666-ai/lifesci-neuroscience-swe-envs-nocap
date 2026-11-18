# Issue

**Title:** Enabling to run run.sim() more than once

## Description

By moving the initialization of the spike writer to 'initialize' function, it enables to run run.sim() more than once.

Without this modification, run.sim() hits the error because the temporary spike file is closed by 'finalize', but not reinitialized.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2c1229edb9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.