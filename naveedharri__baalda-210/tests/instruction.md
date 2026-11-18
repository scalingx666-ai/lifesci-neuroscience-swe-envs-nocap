# Issue

**Title:** Hide the AI settings page for now

## Description

Hides the AI (Beta) entry in Vault Settings behind a `SHOW_AI_TAB` flag in `VaultSettingsDialog.tsx`. Any request for the "ai" tab (initial tab, Health's diagnostics link) opens Health instead. No other code changes; flip the flag to bring it back. Desktop tsc clean, 2408 tests pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `44344029670d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.