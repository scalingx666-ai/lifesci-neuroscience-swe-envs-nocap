# Issue

**Title:** feat: Partial automation update

## Description

Updated the components and hooked the UI and new states in, but the underlying functions are still relying on the ProbeManager system.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e62e2443b4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.