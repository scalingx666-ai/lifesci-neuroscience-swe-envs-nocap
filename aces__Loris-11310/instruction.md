# Issue

**Title:** [modules | user_accounts] Backport (to 26.0-release) authorization bypass security fix (GHSA-f488-7r46-r42v)

## Description

## What was wrong

The User Accounts module did not consistently enforce site and project access restrictions when a user account was accessed directly through an edit URL.

A user with restricted User Accounts permissions could potentially bypass the normal listing restrictions and access or modify user accounts outside their authorized scope.

## What changed

Updated the User Accounts edit flow so the target user identifier is loaded before access permissions are evaluated.

This ensures the authorization checks have the necessary user information and can correctly enforce the existing site and project restrictions for direct edit URLs.

## Reference

Backport of the upstream security fix addressing [GHSA-f488-7r46-r42v](https://github.com/aces/Loris/security/advisories/GHSA-f488-7r46-r42v).

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.