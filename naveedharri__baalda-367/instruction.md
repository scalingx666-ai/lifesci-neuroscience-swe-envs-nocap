# Issue

**Title:** Release 0.1.101

## Description

Server-only hotfix, silent release.

- OAuth connector grants made before vault bindings were recorded act on the user's sole vault. Allow-listing and the conversion gate now see them too, so a vault no longer encrypts without giving those connections its key. The OAuth sign-in and consent flow is unchanged.
- The shrink-events listing reads note sizes with the request's vault key on encrypted vaults instead of failing.
- Version 0.1.101 (no release notes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcf12e132d32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.