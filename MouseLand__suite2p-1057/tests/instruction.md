# Issue

**Title:** Qt6 CheckState Fix for Windows Users

## Description

- Fixes a bug where the graphics scene is lost when toggling a few settings due to the way the "state" is handled by Qt6. 
- Also fixes the environment creation statement for developers in the README

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07d92228a62c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.