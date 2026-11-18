# Issue

**Title:** [modules | bvl_feedback] Backport (to 26.0-release) security fix (GHSA-9h4g-m8c4-x84p)

## Description

## What was wrong

Some AJAX requests in the `bvl_feedback` module did not properly check whether the user had permission to access the feedback functionality.

## What changed

Added a permission check to ensure that only users with the `bvl_feedback` permission can perform these requests. Unauthorized users now receive a `403 Forbidden` response.

## Reference

Backport of the security fix for [[GHSA-9h4g-m8c4-x84p](https://github.com/aces/Loris/security/advisories/GHSA-9h4g-m8c4-x84p)] to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.