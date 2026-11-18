# Issue

**Title:** EBR-51 Fix startup of tvb web

## Description

This was tested on:
- Mac Distribution
- Linux Distribution
- Windows Distribution
- Windows and Linux in py-charm (dev mode)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `493328cf3f01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.