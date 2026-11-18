# Issue

**Title:** Fix lmk tolerance

## Description

The Genu landmark tolerance was just slightly too small to accommodate numerical computation differences on different computer build environments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb5f057056f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.