# Issue

**Title:** Fix for updated PostgreSQL version

## Description

Removing hardcoded version numbers by using the folder from DB_CONF_FILE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d4f1892f1fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.