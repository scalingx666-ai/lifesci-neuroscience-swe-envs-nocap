# Issue

**Title:** resolve issues displaying HTML on Windows OS

## Description

This PR addresses an issue with how file paths are handled on Windows operating systems. This should resolve the additional errors reported in #4.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b43de91c428`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.