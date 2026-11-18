# Issue

**Title:** BUG: Ensure images passed to ANTs executables have correct pixel type

## Description

This prevents silent errors or access violations when pointers were not of the correct type.

Some functions already cloned images to the expected type(s), but others did not. For example, #918

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ebc376434b6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.