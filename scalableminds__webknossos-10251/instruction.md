# Issue

**Title:** Improve text contrast in the welcome toast

## Description

### Summary
Since the theme refresh (#10146), the dark theme's grey `colorText` made the welcome toast's body text and close icon barely readable on the blue background. The toast now uses antd's `colorTextLightSolid` token for its text, headings and close icon. The title is also one heading level larger (24px instead of 18px), since it looked too small next to the body text with the new font.

No changelog entry, since #10146 is not released yet.

### Steps to test:
- On a wkorg instance, open a public dataset while logged out with a fresh local storage (or clear `novelUserExperienceInfos.hasSeenWelcomeToast`)
- The welcome toast in the bottom right should show white body text and a clearly visible close icon

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5c214df257c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.