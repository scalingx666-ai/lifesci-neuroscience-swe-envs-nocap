# Issue

**Title:** [Enhancement] Change test framework from Nose to pytest

## Description

The unit tests are run using `pytest` ([https://pytest.org](https://pytest.org)) in replacement for the deprecated `nose`.

This PR addresses #408.

Travis CI settings were updated to use the new framework.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `165276fe2617`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.