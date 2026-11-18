# Issue

**Title:** stop BLE streaming on TypeError

## Description

TypeError happens when the device is shut down or goes out of range. The code now follows same pattern as USB streaming and stops the parser.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ad28a89a87a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.