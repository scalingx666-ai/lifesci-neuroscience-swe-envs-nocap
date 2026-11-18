# Issue

**Title:** Fixed test suite building for multiple modules

## Description

This PR replaces custom test suite building with `unittest.main()` and a matching verbosity (resolves ). It also includes some depreciation warning fixes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8fd05f66f640`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.