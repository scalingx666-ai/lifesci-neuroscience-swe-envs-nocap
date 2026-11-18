# Issue

**Title:** fix: Remove non-alphanumeric characters from fmapid in fmapreg transform

## Description

Addresses the immediate symptoms in #3485. I can't promise that this will be the last such fix.

Associated changes for locating precomputed transforms are also made.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa0125e37982`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.