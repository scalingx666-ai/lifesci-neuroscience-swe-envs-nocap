# Issue

**Title:** CI: add workflow to detect s3 issues

## Description

In an effort to catch cases like #192 sooner, this adds a workflow to inspect all template files' S3 URLs, and error if any issues are encountered.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd9fc1e0fe7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.