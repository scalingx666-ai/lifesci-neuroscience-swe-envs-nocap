# Issue

**Title:** [TST] Added windows/macos unit tests

## Description

This PR expands the unit tests with macOS and Windows unit tests for Python. To that end, it alters `brainstat.tests.testutil.datadir` to be compatible with Windows. 

MATLAB remains Ubuntu only because the MATLAB runner is not available on macOS and Windows. 

- .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a44f1ca04c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.