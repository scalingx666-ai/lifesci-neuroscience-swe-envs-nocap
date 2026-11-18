# Issue

**Title:** Add ARM (explicit) runners to github CI/CD

## Description

This adds three runners for the workflow:

- Windows 11 ARM
- Ubuntu 24.04 ARM
- OSX Intel (macos-latest is ARM)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22cae131c1a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.