# Issue

**Title:** Apply Repo-Review rules

## Description

* PC170: Uses PyGrep hooks (only needed if rST present)
* PC191: Ruff show fixes if fixes enabled
* PC903: Specified pre-commit CI schedule
* PP304: Sets the log level in pytest

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d5974152175`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.