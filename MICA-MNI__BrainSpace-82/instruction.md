# Issue

**Title:** [TST] Remove 3.6 unit tests, add 3.10 unit tests.

## Description

This PR adds Python 3.10 to the unit tests and removes Python 3.6. Python 3.6 has reached its end of life almost a year ago so maintaining support seems unnecessary.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c60b0aea7ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.