# Issue

**Title:** refactor(worker): Drop commit_files and run validation via on_head hook

## Description

Consolidate git_commit and commit_files. This runs validation for all changes where head advances. Avoids relying on the fallback validation in some cases (such as on file deletion).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abc09b2e302e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.