# Issue

**Title:** Release v0.1.58

## Description

Version bump across the four release files (`package.json`, `tauri.conf.json`, `Cargo.toml`, `Cargo.lock`) so the promotion to `main` ships and running apps auto-update.

Ships #134 — the note-doubling fix: `coldApply` no longer re-ingests the update it is about to apply, three more ingest races closed in `NoteBridge`, bridge teardown no longer drops un-persisted updates, and the size ceiling bounds the doc rather than each message.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5bd939499a9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.