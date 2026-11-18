# Issue

**Title:** Update GHA to use setup-python@v5 instead of v1

## Description

- Making it v5 removes all the warnings we get for using deprecated GHA
- Add codespell GHA to be triggered for dev branch as well.

Partially fix #307

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `989b18560709`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.