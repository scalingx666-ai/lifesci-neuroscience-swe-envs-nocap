# Issue

**Title:** CI: accept transient 5xx in link check

## Description

### CI: accept transient 5xx in link check

PR link checks went red on dataia.eu 500 and GitHub 503 (#1242, #1246,
#1247), not on dead links. Accept 500/502/503/504; 404/410/DNS still
fail. Closes the stale weekly reports #1031 and #1131.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `723cca6fe8a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.