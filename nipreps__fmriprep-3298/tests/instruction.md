# Issue

**Title:** MNT: Pin libitk 5.3 and note dependencies

## Description

libitk 5.4 was being installed, while ANTs is built against libitk 5.3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e863b777c79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.