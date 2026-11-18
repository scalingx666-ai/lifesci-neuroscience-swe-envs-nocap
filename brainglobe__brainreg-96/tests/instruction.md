# Issue

**Title:** Check that brain geometry is valid.

## Description

Fix a bug where a wrong brain geometry could be provided and not caught when parsing args.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17f607f0f8ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.