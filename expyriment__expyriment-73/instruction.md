# Issue

**Title:** small workaround to be able to run the test suite on computers with French Keyboards

## Description

On French keyboards, one is blocked when running the visual part of the test suite because the keys '0' '1' and '2' are not accessible. I modified the script to also accept f1, f2 and f3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc4096f5ae37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.