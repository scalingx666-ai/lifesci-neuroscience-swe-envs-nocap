# Issue

**Title:** fix: replace deprecated `codecs.open()` call

## Description

Replaces the deprecated `codecs.open()` calls with `open()`. Python 3.14 raises are deprecation warning when calling the old routine, so it's about time to replace it. These changes are compatible with older Python versions even below 3.10.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a497101ffdc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.