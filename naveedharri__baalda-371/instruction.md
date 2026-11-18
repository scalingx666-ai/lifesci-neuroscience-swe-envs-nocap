# Issue

**Title:** Release 0.1.105

## Description

Silent release.

- Attachment download links on an encrypted vault send the vault key on the first request (one request instead of two).
- Version 0.1.105 (no release notes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17124b9b3b13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.