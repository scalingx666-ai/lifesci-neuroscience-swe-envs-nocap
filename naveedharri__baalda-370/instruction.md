# Issue

**Title:** Release 0.1.104

## Description

Silent server hotfix.

- An existing vault encrypts as soon as an owner/admin app converts it; it no longer waits for every MCP token, AI connector and public link to pick up the key. Connections allow-listed at conversion still pick it up on their next use while a member app holds the key; any that cannot are reconnected or recreated once.
- MCP tells a connection without the key what to do (reconnect, or make a new token).
- Version 0.1.104 (no release notes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `392333d65345`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.