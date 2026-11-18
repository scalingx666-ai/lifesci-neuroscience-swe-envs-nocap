# Issue

**Title:** [modules | issue_tracker] Backport (to 26.0-release) issue tracker access check security fix (GHSA-c9q6-5f24-p7mj)

## Description

## What was wrong

The Issue Tracker frontend restricted edit permissions, but the backend did not correctly verify whether a user was authorized to edit a specific issue.

This could allow a user to modify an issue without having the appropriate backend permission.

## What changed

Added backend permission checks before updating an issue.

The checks now verify whether the user has permission to:

- Edit all issues
- Edit issues associated with their site
- Edit their own reported issue

The existing and requested issue site permissions are also validated before allowing the update.

## Reference

Backport of the upstream security fix addressing [GHSA-c9q6-5f24-p7mj](https://github.com/aces/Loris/security/advisories/GHSA-c9q6-5f24-p7mj).

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.