# Issue

**Title:** Release 0.1.107

## Description

Silent hotfix.
- Attachments whose bytes the server stores itself (not the file store) download on encrypted vaults again: the download sends the vault key and client version.
- Version 0.1.107 (no release notes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9a35816b17f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.