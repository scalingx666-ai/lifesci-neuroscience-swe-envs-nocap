# Issue

**Title:** updated csvprint to python3

## Description

Updated shebang and syntax to python 3.
Removed unused imports and semicolons.
Changed file read to read non-binary files.

Does this need to support files in both binary and non-binary format?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea6690a49463`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.