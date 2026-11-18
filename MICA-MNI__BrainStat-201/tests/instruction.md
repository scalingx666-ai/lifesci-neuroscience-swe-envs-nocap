# Issue

**Title:** [REF] General code cleanup

## Description

This PR just cleans up some of the mess. The only functional change is a change in the order of arguments in `fetch_parcellation()`. Also, Python 3.6 support is dropped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d54ea1af0d79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.