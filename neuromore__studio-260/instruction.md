# Issue

**Title:** Improve ARCH detection in detect-host.mk

## Description

Fixes building on ARM64 - specifically macOS. Linux/Win untested.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d3d8a69cd7b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.