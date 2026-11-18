# Issue

**Title:** Add pre-processing flag and functions applicable to fMOST datastes

## Description

Add `--pre-processing` command line option, which accepts strings such as 'fmost', 'none', 'default'.
Add pre-processing functions specifically for fMOST datasets, which remove horizontal stripes and background.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9ef993c37f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.