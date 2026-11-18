# Issue

**Title:** Release 0.1.103

## Description

Silent server hotfix.

- Connecting Claude/ChatGPT to a vault that is still converting goes through as before encryption; only keyed vaults need the desktop to finish the connection. A waiting consent page on such a vault continues on its own.
- Version 0.1.103 (no release notes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7bb8b24f2a67`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.