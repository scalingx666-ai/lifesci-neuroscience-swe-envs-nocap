# Issue

**Title:** Fix https://github.com/sccn/liblsl/issues/276

## Description

Be explicit with functions that take no parameter(s) by writing 'void' in the function prototype.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64988c6a14b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.