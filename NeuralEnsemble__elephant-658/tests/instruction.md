# Issue

**Title:** [Fix] CI deprecated cache action

## Description

This PR updates the cache action in the CI workflow to the latest version due to the deprecation of actions/cache: v4.0.2, which caused the tests to fail.

Error message:

`This request has been automatically failed because it uses a deprecated version of `actions/cache: v4.0.2`. Please update your workflow to use v3/v4 of actions/cache to avoid interruptions. Learn more: https://github.blog/changelog/2024-12-05-notice-of-upcoming-releases-and-breaking-changes-for-github-actions/#actions-cache-v1-v2-and-actions-toolkit-cache-package-closing-down
`

See: <https://github.blog/changelog/2024-12-05-notice-of-upcoming-releases-and-breaking-changes-for-github-actions/#actions-cache-v1-v2-and-actions-toolkit-cache-package-closing-down>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be33aa41e323`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.