# Issue

**Title:** Make welcome banner Close button more prominent

## Description

### Summary
The "Close" button on the dashboard welcome banner was easy to miss. It is now a larger, white-outlined button with a light hover/active tint, so it stands out on the blue background.

### Steps to test:
- Open the dashboard as a user who has not dismissed the welcome banner
- The Close button in the top right is clearly visible, tints on hover, and dismisses the banner

------
- [x] Added changelog entry
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2742e66e56a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.