# Issue

**Title:** MRG: Add appveyor file for daily build

## Description

Set up daily builds on Appveyor.

This should be merged after:

* #435
* #436
* #437

[skip ci]

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a67ae6233506`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.