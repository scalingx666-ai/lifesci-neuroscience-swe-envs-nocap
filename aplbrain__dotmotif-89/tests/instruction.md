# Issue

**Title:** Fix issue where grammar file was excluded from pip installs

## Description

.

Resolves the installation error encountered in #86. Thank you to @lix2k3 for reporting :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f63c57da9e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.