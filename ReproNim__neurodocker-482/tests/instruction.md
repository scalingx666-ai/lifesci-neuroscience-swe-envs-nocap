# Issue

**Title:** update pre-commit

## Description

Replaces #470

- update black version
- add flake 8
- add mypy and update its dependency version and config
- run `pre-commit run -a` and fix any errors

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad2f3a62afa9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.