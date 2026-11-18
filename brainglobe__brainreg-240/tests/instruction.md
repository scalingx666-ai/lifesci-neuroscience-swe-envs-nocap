# Issue

**Title:** Remove extra QT library setup step

## Description

Previously two actions ran to set up the QT libraries for testing on Linux, removed one of them to streamline and standardise our testing across BrainGlobe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55401aeccc33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.