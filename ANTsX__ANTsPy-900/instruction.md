# Issue

**Title:** Remove explicit dependency from old scipy version.

## Description

Revert  /  as statsmodels has been fixed in [version 0.14.5](https://github.com/statsmodels/statsmodels/releases/tag/v0.14.5), released in July 2025.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eee47afeb1b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.