# Issue

**Title:** TVB-3049 TVB-3044 Prepare release 2.7.1

## Description

- [x] Enable back siibra after they fixed the bug on communicating with KG query v3
- [x] review tvb-framework package to exclude bids-monitor (produces failures in conda-forge)
- [x] ensure builds stay on jenkins slave

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89a826dba77a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.