# Issue

**Title:** Hotfix: AI connections keep their key claim across refreshes

## Description

Silent hotfix (server only, one new table).
- An allow-listed OAuth connection refreshed while no member's key is held now carries its claim to the new tokens (the root grant's allow entry plus the root refresh token, sealed under the new refresh token only). A later refresh while a key is held upgrades it. Before, one such refresh meant the connection had to be reconnected.
- A carry inserted straight into the database never yields a key (tested with real copied root values).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71d9ca87ef02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.