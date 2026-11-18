# Issue

**Title:** Fix Qt Bluetooth LE Crash on macOS

## Description

* Fixes crash on macOS when trying to connect to a HRM and Bluetooth permissions were already granted
* Ported from

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8dfb998babda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.