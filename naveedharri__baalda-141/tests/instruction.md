# Issue

**Title:** Release v0.1.59

## Description

Version bump for the v0.1.59 release: `package.json`, `tauri.conf.json`, `Cargo.toml`, `Cargo.lock`.

Ships #140 — the vault channel now connects during the prime window instead of behind the whole reconcile, the server answers "is this client up to date?" from a cached per-doc state vector (migration 025), and the badge stops re-syncing what is already synced.

Release notes and changelog for these landed with #140.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `232a86fe81e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.