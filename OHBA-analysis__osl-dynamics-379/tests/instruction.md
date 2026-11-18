# Issue

**Title:** Welch power spectrum: fixed slicing of the frequencies to keep

## Description

Fixed the slicing of the frequencies in the Welch spectrum calculation to match the multitaper calculation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8e0b474ccf2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.