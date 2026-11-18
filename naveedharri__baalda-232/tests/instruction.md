# Issue

**Title:** Keep update restarts in the background and make silent releases the default

## Description

- An auto-update restart no longer pulls Baalda in front of the app the user is working in. The old process records whether it was focused; the new one hides itself on macOS before its window appears and skips taking focus on every platform. The record expires after 10 minutes.
- Releases are silent by default: What's New appears only when the version's own section in docs/RELEASE_NOTES.md has points. No section or an empty one adds a hidden marker to the release body and the desktop skips the modal. The workflow no longer falls back to another version's notes.
- Documented in docs/RELEASE.md and the RELEASE_NOTES.md header.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70fdfb052572`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.